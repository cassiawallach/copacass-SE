import { LightningElement, wire } from "lwc";
import { MessageContext, publish, subscribe } from "lightning/messageService";
import { CurrentPageReference } from "lightning/navigation";

import getSystemPropertiesFromPipelineOfUserStory from "@salesforce/apex/SystemProperties.getSystemPropertiesFromPipelineOfUserStory";
import COMMIT_PAGE_COMMUNICATION_CHANNEL from "@salesforce/messageChannel/copado__CommitPageCommunication__c";

export default class UserStoryCommitTableActions extends LightningElement {
  // loading
  _isWorking = false;
  isLoading = false;
  _sourceMemberAvailableChecked = true;
  _listOfMetadataTypesAvailable = true;

  _SFCC_METADATA = "SFCC_METADATA_ITEMS";
  _SFCC_SITES = "SFCC_SITES";

  get showSpinner() {
    return (
      this._isWorking ||
      this._sourceMemberAvailableChecked === false ||
      this._listOfMetadataTypesAvailable === false
    );
  }

  @wire(MessageContext)
  _context;

  @wire(CurrentPageReference)
  getParameters(pageReference) {
    if (pageReference && pageReference.state) {
      // TODO: use proper namespace loading
      // const parameterName = `${namespace || 'c__'}recordId`;

      this.recordId = pageReference.state["copado__recordId"];
    }
  }

  _subscribeToMessageService() {
    subscribe(this._context, COMMIT_PAGE_COMMUNICATION_CHANNEL, (message) =>
      this._handleCommitPageCommunicationMessage(message)
    );
  }

  _handleCommitPageCommunicationMessage(message) {
    this._performWithProgress(() => {
      try {
        switch (message.type) {
          case "request":
            console.log("request", JSON.stringify(message));
            break;
          // extension
          case "retrievedChanges":
          case "pulledChanges":
            console.log("changes", JSON.stringify(message));
            break;
          default:
        }
      } catch (error) {
        console.log("error", error);
      }
    });
  }

  connectedCallback() {
    this._subscribeToMessageService();
  }

  _performWithProgress(process) {
    this.isLoading = true;
    // workaround to show spinner
    // eslint-disable-next-line @lwc/lwc/no-async-operation
    setTimeout(() => {
      if (process) {
        process();
      }
      this.isLoading = false;
    }, 0);
  }

  // TODO: fix race condition
  renderedCallback() {
    getSystemPropertiesFromPipelineOfUserStory({
      userStoryId: this.recordId,
      names: [this._SFCC_METADATA, this._SFCC_SITES]
    })
      .then((properties) => {
        const metadata = properties[this._SFCC_METADATA].split(/\r?\n|\r|\n/g);
        const sites = (properties[this._SFCC_SITES] || "")
            .split(/\r?\n|\r|\n/g)
            .filter((x) => x !== "");
        const filtered = metadata.reduce((arr, meta) => {
          if (meta.includes("<site-id>")) {
            arr.push(...sites.map((site) => meta.replace("<site-id>", site)));
          } else {
            arr.push(meta);
          }

          return arr;
        }, []);

        setTimeout(this.retrieveChanges(filtered), 250);
      })
      .catch((e) => {
        console.log("apex error", e);
      });
  }

  async retrieveChanges(metadata) {
    try {
      this._isWorking = true;

      const allMetadataFound = metadata
        .map((file) => ({
          Operation: "Add",
          MemberName: file,
          MemberType: "xml",
          Directory: "",
          LastModifiedDate: "",
          LastModifiedByName: "",
          Category: "ccmetadata"
        }))
        .sort(({ MemberName: a }, { MemberName: b }) =>
          a < b ? -1 : a > b ? 1 : 0
        );

      const payload = {
        type: "retrievedChanges",
        value: allMetadataFound
      };

      publish(this._context, COMMIT_PAGE_COMMUNICATION_CHANNEL, payload);
    } catch (exc) {
      console.log("exception", JSON.stringify(exc));
    } finally {
      this._isWorking = false;
    }
  }
}