"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.ChatRepository = void 0;
class ChatRepository {
    constructor() {
        this._chatRoomInfoList = [];
        this._chatMessageList = [];
    }
    async getChatRoomInfoListAfterTimestamp(userId, timestamp) {
        // TODO database gateway access
        await new Promise(resolve => setTimeout(resolve, 500));
        let chatIdList = new Map();
        for (const chatRoomInfo of this._chatRoomInfoList)
            if (chatRoomInfo.userId == userId && chatRoomInfo.date.getDate() > timestamp.getDate()) {
                chatIdList.set(chatRoomInfo.userId, null);
            }
        return this._getChatRoomInfoListByChatIds(chatIdList, userId);
    }
    async getChatRoomInfoList(userId) {
        // TODO database gateway access
        await new Promise(resolve => setTimeout(resolve, 500));
        let chatIdList = new Map();
        for (const chatRoomInfo of this._chatRoomInfoList)
            if (chatRoomInfo.userId == userId) {
                chatIdList.set(chatRoomInfo.userId, null);
            }
        return this._getChatRoomInfoListByChatIds(chatIdList, userId);
    }
    async _getChatRoomInfoListByChatIds(chatIdList, exclusiveUserId) {
        // TODO database gateway access
        await new Promise(resolve => setTimeout(resolve, 500));
        let chatRoomInfoByChatIdsList = [];
        for (const chatRoomInfo of this._chatRoomInfoList) {
            if (chatIdList.has(chatRoomInfo.chatId) && chatRoomInfo.userId != exclusiveUserId) {
                chatRoomInfoByChatIdsList.push(chatRoomInfo);
            }
        }
        return chatRoomInfoByChatIdsList;
    }
    async getChatMessagesByChatIdAfterTimestamp(chatId, timestamp) {
        // TODO database gateway access
        await new Promise(resolve => setTimeout(resolve, 500));
        let chatMessageList = [];
        for (const chatMessage of this._chatMessageList) {
            if (chatMessage.chatId == chatId && chatMessage.dateSent.getDate() > timestamp.getDate())
                chatMessageList.push(chatMessage);
        }
        return chatMessageList;
    }
    async getChatMessagesByChatId(chatId) {
        // TODO database gateway access
        await new Promise(resolve => setTimeout(resolve, 500));
        let chatMessageList = [];
        for (const chatMessage of this._chatMessageList) {
            if (chatMessage.chatId == chatId)
                chatMessageList.push(chatMessage);
        }
        return chatMessageList;
    }
    async isUserInChat(userId, chatId) {
        // TODO database gateway access
        await new Promise(resolve => setTimeout(resolve, 500));
        for (const chatRoomInfo of this._chatRoomInfoList)
            if (chatRoomInfo.chatId == chatId && chatRoomInfo.userId == userId)
                return true;
        return false;
    }
    async addChatMessage(userId, chatId, message) {
        // TODO database gateway access
        await new Promise(resolve => setTimeout(resolve, 500));
        // check chatId if it exists and if not you have to make it
        // this._chatMessageList.push
    }
}
exports.ChatRepository = ChatRepository;
