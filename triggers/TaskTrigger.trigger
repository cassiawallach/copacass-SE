trigger TaskTrigger on Task (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
	TriggerFactory.createHandler(Task.sObjectType);
}