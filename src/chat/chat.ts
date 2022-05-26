import { EventEmitter } from "stream";
import { AuthorizationInfo } from "../account/account";
import { AccountRepository } from "../account/account_repository";
import { ChatMessage, ChatRepository, ChatRoomInfo } from "./chat_repository";

type SubscriptionMessage = AuthorizationInfo
type UnSubscriptionMessage = AuthorizationInfo

export type ChatRoomsRequest = {
    authorizationInfo: AuthorizationInfo,
    timestamp?: Date
}
export type ChatMessagesRequest = {
    chatId: string,
    authorizationInfo: AuthorizationInfo,
    timestamp?: Date,
}
export type AddChatMessageRequest = {
    chatId?: string,
    firstName?: string,
    lastName?: string,
    authorizationInfo: AuthorizationInfo,
    message: string,
}


export class Chat extends EventEmitter {
    private _subscribers: Map<string, null> = new Map()
    private _chatRepository: ChatRepository
    private _accountRepository: AccountRepository;
    constructor(chatRepository: ChatRepository, accountRepository: AccountRepository) {
        super()
        this._chatRepository = chatRepository
        this._accountRepository = accountRepository
    }
    public subscribe(subscriptionMessage: SubscriptionMessage) {
        this._subscribers.set(subscriptionMessage.username, null)
    }
    public unsubscribe(unSubscriptionMessage: UnSubscriptionMessage) {
        this._subscribers.delete(unSubscriptionMessage.username)
    }

    public async getChatRoomInfoList(chatRoomsRequest: ChatRoomsRequest): Promise<Array<ChatRoomInfo>> {
        let userId: string = (await this._accountRepository.getUsernameInfo(chatRoomsRequest.authorizationInfo.username))?.username!
        if (chatRoomsRequest.timestamp !== undefined)
            return this._chatRepository.getChatRoomInfoListAfterTimestamp(userId, chatRoomsRequest.timestamp)
        return this._chatRepository.getChatRoomInfoList(userId)
    }
    public async getChatMessages(chatMessagesRequest: ChatMessagesRequest): Promise<Array<ChatMessage>> {
        let userId: string = (await this._accountRepository.getUsernameInfo(chatMessagesRequest.authorizationInfo.username))?.username!
        if (!this._chatRepository.isUserInChat(userId, chatMessagesRequest.chatId))
            return []
        if (chatMessagesRequest.timestamp !== undefined)
            return this._chatRepository.getChatMessagesByChatIdAfterTimestamp(chatMessagesRequest.chatId, chatMessagesRequest.timestamp)
        return this._chatRepository.getChatMessagesByChatId(chatMessagesRequest.chatId)
    }
    public async addMessage(addChatMessageRequest: AddChatMessageRequest): Promise<void> {
        let userId: string = (await this._accountRepository.getUsernameInfo(addChatMessageRequest.authorizationInfo.username))?.username!
        if (addChatMessageRequest.chatId !== undefined) {

            if (!this._chatRepository.isUserInChat(userId, addChatMessageRequest.chatId))
                return
        }
        else {

        }


    }
    private emitMessages() {
        
    }

}