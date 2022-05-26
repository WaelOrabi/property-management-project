import { Message } from "../message";
import { WebsocketConnection } from "../websocket/websocket_connection";
import { WebsocketInfoManager } from "../websocket_info_manager";
import { MessageHandler } from "./message_handler";



export class MessageDestinationHandler implements MessageHandler {

    public handle(message: Message): void {
        let websocketConnection: WebsocketConnection | undefined =
            WebsocketInfoManager.getInstance().getWebsocketConnectionBySocketId(message.socketId)
        websocketConnection?.send(message.data)
    }
}