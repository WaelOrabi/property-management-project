import WebSocket from 'ws';
import http from 'http';
import express from 'express';

import { AccountRepository } from './account/account_repository';
import { Account, ChangePasswordMessage, SignInMessage, SignUpMessage } from './account/account';
import { WebsocketInfoManager } from './websocket_info_manager';
import { EventHandler } from './handler/event_handler';
import { MessageDestinationHandler } from './handler/message_destination_handler';
import { AuthorizationHandler } from './handler/authorization_handler';
import { AccountServicesHandler } from './handler/account_services_handler';
import { MessageHandler } from './handler/message_handler';
import { SocketsStateHandler } from './handler/sockets_state_handler';
import { Authorizer } from './authorizer';
import { toNamespacedPath } from 'path';
import { ChatHandler } from './handler/chat_handler';
import { Chat } from './chat/chat';
import { ChatRepository } from './chat/chat_repository';


export class ServerController {
    private _httpServer: http.Server;
    private _app: express.Express;
    private _server: WebSocket.Server;
    private _account: Account
    private _chat: Chat

    // TODO refactor into new class
    private _accountServicesHandler: AccountServicesHandler
    private _eventHandler: EventHandler
    private _messageDestinationHandler: MessageDestinationHandler
    private _authorizationHandler: AuthorizationHandler
    private _chatHandler: ChatHandler
    private _eventToMsg: Map<string, MessageHandler>
    private _socketsStateHandler: SocketsStateHandler
    constructor() {
        // TODO refactor into new class 
        this._messageDestinationHandler = new MessageDestinationHandler()
        this._authorizationHandler = new AuthorizationHandler(this._messageDestinationHandler)
        this._account = new Account(10, new AccountRepository())
        this._chat = new Chat(new ChatRepository(), new AccountRepository())
        this._accountServicesHandler = new AccountServicesHandler(this._account, this._messageDestinationHandler)

        this._chatHandler = new ChatHandler(this._chat, this._messageDestinationHandler)
        this._eventToMsg = new Map()
        this._eventToMsg.set('signIn', this._accountServicesHandler)
        this._eventToMsg.set('signUp', this._accountServicesHandler)
        this._eventToMsg.set('changePassword', this._accountServicesHandler)
        this._eventToMsg.set('authorize', this._authorizationHandler)
        this._eventToMsg.set('signOut', this._authorizationHandler)
        this._eventToMsg.set('subscribe', this._chatHandler)
        this._eventToMsg.set('addMessage', this._chatHandler)
        this._eventHandler = new EventHandler(this._eventToMsg)
        this._socketsStateHandler = new SocketsStateHandler()



        this._app = express()
        this._app.use(express.json())
        this._httpServer = http.createServer(this._app)

        this._server = new WebSocket.Server({ server: this._httpServer })

        this._httpServer.listen(process.env.PORT, () => { console.log(`Server running on port ${process.env.PORT}`) })

        this._initializeWebsocketInfoManager()
        this._listenToConnections()
        this._API()

    }
    private _initializeWebsocketInfoManager() {
        WebsocketInfoManager.initialize(this._eventHandler, this._socketsStateHandler)
    }

    _listenToConnections() {
        this._server.on('connection', (client: WebSocket.WebSocket) => this._onConnection(client))
    }

    private _onConnection(client: WebSocket.WebSocket): void {
        WebsocketInfoManager.getInstance().createWebsocketConnection(client, new Authorizer(this._account))
    }

    private _API() {
        // TODO refactor & create classes to validate input
        let account: Account = new Account(10, new AccountRepository())

        this._app.post('/signup', async (req, res) => {

            let msg: SignUpMessage = {
                username: req.body.username,
                password: req.body.password,
                firstName: req.body.firstName,
                lastName: req.body.lastName
            };
            return res.json(await account.signUp(msg))
        })

        this._app.post('/signin', async (req, res) => {
            let msg: SignInMessage = {
                username: req.body.username,
                password: req.body.password,
            };
            return res.json(await account.signIn(msg))
        })

        this._app.post('/change-password', async (req, res) => {
            let msg: ChangePasswordMessage = {
                authorizationInfo: (await account.verifyToken(req.body.token)).authorizationInfo!,
                oldPassword: req.body.oldPassword,
                newPassword: req.body.newPassword,
            };
            return res.json(await account.changePassword(msg))
        })
    }
}
