"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.MessageDestinationHandler = void 0;
const websocket_info_manager_1 = require("../websocket_info_manager");
class MessageDestinationHandler {
    handle(message) {
        let websocketConnection = websocket_info_manager_1.WebsocketInfoManager.getInstance().getWebsocketConnectionBySocketId(message.socketId);
        websocketConnection?.send(message.data);
    }
}
exports.MessageDestinationHandler = MessageDestinationHandler;
