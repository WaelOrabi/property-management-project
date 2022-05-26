"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.WebsocketInfoManager = void 0;
const websocket_connection_1 = require("./websocket/websocket_connection");
class WebsocketInfoManager {
    constructor(messageHandler, socketStateHandler) {
        this._socketIdToWebsocketConnection = new Map();
        this._socketIdToAuthorizer = new Map();
        this._messageHandler = messageHandler;
        this._socketStateHandler = socketStateHandler;
    }
    static getInstance() {
        if (!WebsocketInfoManager._instance)
            throw new Error("[WebsocketInfoManager] is not initialized.");
        return WebsocketInfoManager._instance;
    }
    static initialize(messageHandler, socketStateHandler) {
        if (!WebsocketInfoManager._instance)
            WebsocketInfoManager._instance = new WebsocketInfoManager(messageHandler, socketStateHandler);
        return WebsocketInfoManager._instance;
    }
    createWebsocketConnection(client, authorizer) {
        let websocketConnection = new websocket_connection_1.WebsocketConnection(client, (msg) => this._handleMessage(msg), (socketId) => this._disconnectionCallback(socketId));
        this._socketIdToWebsocketConnection.set(websocketConnection.socketId, websocketConnection);
        this._socketIdToAuthorizer.set(websocketConnection.socketId, authorizer);
    }
    getAuthorizerBySocketId(socketId) {
        return this._socketIdToAuthorizer.get(socketId);
    }
    getWebsocketConnectionBySocketId(socketId) {
        return this._socketIdToWebsocketConnection.get(socketId);
    }
    _handleMessage(message) {
        this._socketIdToAuthorizer.get(message.socketId)?.addExistingAuthorizationInfo(message);
        this._messageHandler.handle(message);
    }
    _disconnectionCallback(socketId) {
        this._socketStateHandler.handle({
            authorizationInfo: this._socketIdToAuthorizer.get(socketId)?.authorizationInfo,
            socketId: socketId, state: 'offline'
        });
        this._socketIdToAuthorizer.delete(socketId);
        this._socketIdToWebsocketConnection.delete(socketId);
    }
}
exports.WebsocketInfoManager = WebsocketInfoManager;
