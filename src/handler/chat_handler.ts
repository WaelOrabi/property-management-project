import { AddChatMessageRequest, Chat, ChatMessagesRequest, ChatRoomsRequest } from "../chat/chat";
import { Message } from "../message";
import { MessageDestinationHandler } from "./message_destination_handler";
import { MessageHandler } from "./message_handler";

export class ChatHandler implements MessageHandler {
    private _chat: Chat
    private _messageDestinationHandler: MessageDestinationHandler

    constructor(chat: Chat, _messageDestinationHandler: MessageDestinationHandler) {
        this._chat = chat
        this._messageDestinationHandler = _messageDestinationHandler
        this._observerChat()
    }
    _observerChat(): void {

    }
    handle(message: Message): void {
        switch (message.data.event) {
            case 'subscribe':

                break;
            case 'addMessage':

                break;
        }
    }

    _toChatRoomsRequest(message: Message): ChatRoomsRequest | undefined {
        /*  if (message.authorizationInfo !== undefined)
             return { authorizationInfo: message.authorizationInfo, timestamp: message.data.timestamp } */
        return undefined
    }
    _toChatMessagesRequest(message: Message): ChatMessagesRequest | undefined {
        return undefined
    }
    _toAddChatMessageRequest(message: Message): AddChatMessageRequest | undefined {
        return undefined

    }
    _handleSubscription(message: Message): void { }
    _handleAddMessage(message: Message): void { }

}