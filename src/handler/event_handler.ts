

import { MessageHandler } from "../handler/message_handler";
import { Message } from "../message";


export class EventHandler implements MessageHandler {
    private _messageToHandler: Map<string, MessageHandler>
    constructor(messageToHandler: Map<string, MessageHandler>) {
        this._messageToHandler = messageToHandler
    }
    public handle(message: Message): void {
        if (message.data.hasOwnProperty('event')) {
            if (this._messageToHandler.has(message.data.event))
                this._messageToHandler.get(message.data.event)?.handle(message)

        }
    }
}