"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.AuthorizationHandler = void 0;
const websocket_info_manager_1 = require("../websocket_info_manager");
class AuthorizationHandler {
    constructor(_messageDestinationHandler) {
        this._messageDestinationHandler = _messageDestinationHandler;
    }
    async handle(message) {
        switch (message.data.event) {
            case 'authorize': {
                let authorizer = websocket_info_manager_1.WebsocketInfoManager.getInstance().getAuthorizerBySocketId(message.socketId);
                if (authorizer !== undefined) {
                    let authReply = await authorizer.authorize(this._toAuthorizationRequestMessage(message.data));
                    let data = {};
                    data.successful = authReply.successful;
                    data.event = message.data.event;
                    if (authReply.error !== undefined)
                        data.error = authReply.error;
                    this._messageDestinationHandler.handle({ data: data, socketId: message.socketId });
                }
                break;
            }
            case 'signOut': {
                let authorizer = websocket_info_manager_1.WebsocketInfoManager.getInstance().getAuthorizerBySocketId(message.socketId);
                if (authorizer !== undefined) {
                    authorizer.disableAuthorization();
                }
                let data = {};
                data.successful = true;
                data.event = message.data.event;
                this._messageDestinationHandler.handle({ data: data, socketId: message.socketId });
                break;
            }
        }
    }
    _toAuthorizationRequestMessage(jsonObject) {
        if (jsonObject.hasOwnProperty('event') && jsonObject.event == 'authorize') {
            if (jsonObject.hasOwnProperty('token'))
                return { token: jsonObject.token };
            return { token: '' };
        }
        return { token: '' };
    }
}
exports.AuthorizationHandler = AuthorizationHandler;
