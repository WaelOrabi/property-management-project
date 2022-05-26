class ConsumedMsgs{
   Map<String, bool> msgsIds = {};
   void addConsumedMsg(String id) {
     msgsIds[id] = true;
   }
   bool isMsgConsumed(String id) {
     return msgsIds.containsKey(id);
   }
}