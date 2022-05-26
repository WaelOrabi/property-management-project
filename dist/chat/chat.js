"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Chat = void 0;
const stream_1 = require("stream");
class Chat extends stream_1.EventEmitter {
    constructor(chatRepository, accountRepository) {
        super();
        this._subscribers = new Map();
        this._chatRepository = chatRepository;
        this._accountRepository = accountRepository;
    }
    subscribe(subscriptionMessage) {
        this._subscribers.set(subscriptionMessage.username, null);
    }
    unsubscribe(unSubscriptionMessage) {
        this._subscribers.delete(unSubscriptionMessage.username);
    }
    async getChatRoomInfoList(chatRoomsRequest) {
        let userId = (await this._accountRepository.getUsernameInfo(chatRoomsRequest.authorizationInfo.username))?.username;
        if (chatRoomsRequest.timestamp !== undefined)
            return this._chatRepository.getChatRoomInfoListAfterTimestamp(userId, chatRoomsRequest.timestamp);
        return this._chatRepository.getChatRoomInfoList(userId);
    }
    async getChatMessages(chatMessagesRequest) {
        let userId = (await this._accountRepository.getUsernameInfo(chatMessagesRequest.authorizationInfo.username))?.username;
        if (!this._chatRepository.isUserInChat(userId, chatMessagesRequest.chatId))
            return [];
        if (chatMessagesRequest.timestamp !== undefined)
            return this._chatRepository.getChatMessagesByChatIdAfterTimestamp(chatMessagesRequest.chatId, chatMessagesRequest.timestamp);
        return this._chatRepository.getChatMessagesByChatId(chatMessagesRequest.chatId);
    }
    async addMessage(addChatMessageRequest) {
        let userId = (await this._accountRepository.getUsernameInfo(addChatMessageRequest.authorizationInfo.username))?.username;
        if (!this._chatRepository.isUserInChat(userId, addChatMessageRequest.chatId))
            return;
    }
}
exports.Chat = Chat;
