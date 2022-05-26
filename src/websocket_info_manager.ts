import WebSocket from "ws"
import { AuthorizationInfo } from "./account/account"
import { Authorizer } from "./authorizer"
import { MessageHandler } from "./handler/message_handler"
import { SocketsStateHandler } from "./handler/sockets_state_handler"
import { Message } from "./message"
import { WebsocketConnection } from "./websocket/websocket_connection"


export type SocketStateInfo = {
    authorizationInfo?: AuthorizationInfo,
    socketId: string,
    state: string
}

export class WebsocketInfoManager {
    private static _instance: WebsocketInfoManager
    private _messageHandler: MessageHandler
    private _socketStateHandler: SocketsStateHandler
    private constructor(messageHandler: MessageHandler, socketStateHandler: SocketsStateHandler) {
        this._messageHandler = messageHandler
        this._socketStateHandler = socketStateHandler
    }
    public static getInstance(): WebsocketInfoManager {
        if (!WebsocketInfoManager._instance)
            throw new Error("[WebsocketInfoManager] is not initialized.")
        return WebsocketInfoManager._instance
    }

    public static initialize(messageHandler: MessageHandler, socketStateHandler: SocketsStateHandler): WebsocketInfoManager {
        if (!WebsocketInfoManager._instance)
            WebsocketInfoManager._instance = new WebsocketInfoManager(messageHandler, socketStateHandler)
        return WebsocketInfoManager._instance

    }
    private _socketIdToWebsocketConnection: Map<string, WebsocketConnection> = new Map()
    private _socketIdToAuthorizer: Map<string, Authorizer> = new Map()

    public createWebsocketConnection(client: WebSocket.WebSocket, authorizer: Authorizer) {
        let websocketConnection: WebsocketConnection = new WebsocketConnection(client, (msg: Message) => this._handleMessage(msg), (socketId: string) => this._disconnectionCallback(socketId))
        this._socketIdToWebsocketConnection.set(websocketConnection.socketId, websocketConnection)
        this._socketIdToAuthorizer.set(websocketConnection.socketId, authorizer)

    }
    public getAuthorizerBySocketId(socketId: string): Authorizer | undefined {
        return this._socketIdToAuthorizer.get(socketId)
    }
    public getWebsocketConnectionBySocketId(socketId: string): WebsocketConnection | undefined {
        return this._socketIdToWebsocketConnection.get(socketId)
    }
    private _handleMessage(message: Message) {
        this._socketIdToAuthorizer.get(message.socketId)?.addExistingAuthorizationInfo(message)
        this._messageHandler.handle(message)
    }
    private _disconnectionCallback(socketId: string) {
        this._socketStateHandler.handle({
            authorizationInfo: this._socketIdToAuthorizer.get(socketId)?.authorizationInfo,
            socketId: socketId, state: 'offline'
        })
        this._socketIdToAuthorizer.delete(socketId)
        this._socketIdToWebsocketConnection.delete(socketId)
    }



}