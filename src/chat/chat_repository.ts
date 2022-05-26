

export type ChatRoomInfo = {
    chatId: string,
    userId: string,
    date: Date,
}
export type ChatMessage = {
    chatId: string,
    userId: string,
    message: string,
    dateSent: Date,
}
export class ChatRepository {
    private _chatRoomInfoList: Array<ChatRoomInfo> = []
    private _chatMessageList: Array<ChatMessage> = []
    public async getChatRoomInfoListAfterTimestamp(userId: string, timestamp: Date): Promise<Array<ChatRoomInfo>> {
        // TODO database gateway access
        await new Promise(resolve => setTimeout(resolve, 500))
        let chatIdList: Map<string, null> = new Map()
        for (const chatRoomInfo of this._chatRoomInfoList)
            if (chatRoomInfo.userId == userId && chatRoomInfo.date.getDate() > timestamp.getDate()) {
                chatIdList.set(chatRoomInfo.userId, null)
            }

        return this._getChatRoomInfoListByChatIds(chatIdList, userId)
    }

    public async getChatRoomInfoList(userId: string): Promise<Array<ChatRoomInfo>> {
        // TODO database gateway access
        await new Promise(resolve => setTimeout(resolve, 500))
        let chatIdList: Map<string, null> = new Map()
        for (const chatRoomInfo of this._chatRoomInfoList)
            if (chatRoomInfo.userId == userId) {
                chatIdList.set(chatRoomInfo.userId, null)
            }
        return this._getChatRoomInfoListByChatIds(chatIdList, userId)
    }

    private async _getChatRoomInfoListByChatIds(chatIdList: Map<string, null>, exclusiveUserId: string): Promise<Array<ChatRoomInfo>> {
        // TODO database gateway access
        await new Promise(resolve => setTimeout(resolve, 500))
        let chatRoomInfoByChatIdsList: Array<ChatRoomInfo> = []
        for (const chatRoomInfo of this._chatRoomInfoList) {
            if (chatIdList.has(chatRoomInfo.chatId) && chatRoomInfo.userId != exclusiveUserId) {
                chatRoomInfoByChatIdsList.push(chatRoomInfo)
            }
        }
        return chatRoomInfoByChatIdsList
    }
    public async getChatMessagesByChatIdAfterTimestamp(chatId: string, timestamp: Date): Promise<Array<ChatMessage>> {
        // TODO database gateway access
        await new Promise(resolve => setTimeout(resolve, 500))
        let chatMessageList: Array<ChatMessage> = []
        for (const chatMessage of this._chatMessageList) {
            if (chatMessage.chatId == chatId && chatMessage.dateSent.getDate() > timestamp.getDate())
                chatMessageList.push(chatMessage)
        }
        return chatMessageList
    }
    public async getChatMessagesByChatId(chatId: string): Promise<Array<ChatMessage>> {
        // TODO database gateway access
        await new Promise(resolve => setTimeout(resolve, 500))
        let chatMessageList: Array<ChatMessage> = []
        for (const chatMessage of this._chatMessageList) {
            if (chatMessage.chatId == chatId)
                chatMessageList.push(chatMessage)
        }
        return chatMessageList
    }
    public async isUserInChat(userId: string, chatId: string): Promise<boolean> {
        // TODO database gateway access
        await new Promise(resolve => setTimeout(resolve, 500))
        for (const chatRoomInfo of this._chatRoomInfoList)
            if (chatRoomInfo.chatId == chatId && chatRoomInfo.userId == userId)
                return true
        return false
    }
    public async addChatMessageByChatId(userId: string, chatId: string, message: string): Promise<void> {
        // TODO database gateway access
        await new Promise(resolve => setTimeout(resolve, 500))
        // check chatId if it exists and if not you have to make it
        // this._chatMessageList.push
    }
    public async addChatMessageByFirstLastName(userId: string, firstName: string, lastName: string, message: string): Promise<void> {
        // TODO database gateway access
        await new Promise(resolve => setTimeout(resolve, 500))
        // check chatId if it exists and if not you have to make it
        // this._chatMessageList.push
    }
}