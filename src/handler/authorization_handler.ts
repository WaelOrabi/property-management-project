import { AuthorizationReplyMessage, AuthorizationRequestMessage, Authorizer } from "../authorizer";
import { Message } from "../message";
import { WebsocketInfoManager } from "../websocket_info_manager";
import { MessageDestinationHandler } from "./message_destination_handler";
import { MessageHandler } from "./message_handler";

export class AuthorizationHandler implements MessageHandler {

    private _messageDestinationHandler: MessageDestinationHandler
    constructor(_messageDestinationHandler: MessageDestinationHandler) {
        this._messageDestinationHandler = _messageDestinationHandler
    }
    async handle(message: Message): Promise<void> {
        switch (message.data.event) {
            case 'authorize': {
                let authorizer: Authorizer | undefined = WebsocketInfoManager.getInstance().getAuthorizerBySocketId(message.socketId)
                if (authorizer !== undefined) {
                    let authReply: AuthorizationReplyMessage = await authorizer.authorize(this._toAuthorizationRequestMessage(message.data))
                    let data: any = {}
                    data.successful = authReply.successful
                    data.event = message.data.event
                    if (authReply.error !== undefined)
                        data.error = authReply.error
                    this._messageDestinationHandler.handle({ data: data, socketId: message.socketId })
                }
                break
            }
            case 'signOut': {
                let authorizer: Authorizer | undefined = WebsocketInfoManager.getInstance().getAuthorizerBySocketId(message.socketId)
                if (authorizer !== undefined) {
                    authorizer.disableAuthorization()

                }
                let data: any = {}
                data.successful = true
                data.event = message.data.event

                this._messageDestinationHandler.handle({ data: data, socketId: message.socketId })
                break
            }
        }
    }
    private _toAuthorizationRequestMessage(jsonObject: any): AuthorizationRequestMessage {
        if (jsonObject.hasOwnProperty('event') && jsonObject.event == 'authorize') {
            if (jsonObject.hasOwnProperty('token'))
                return { token: jsonObject.token }
            return { token: '' }
        }
        return { token: '' }
    }
}