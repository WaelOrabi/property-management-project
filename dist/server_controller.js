"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.ServerController = void 0;
const ws_1 = __importDefault(require("ws"));
const http_1 = __importDefault(require("http"));
const express_1 = __importDefault(require("express"));
const account_repository_1 = require("./account/account_repository");
const account_1 = require("./account/account");
const websocket_info_manager_1 = require("./websocket_info_manager");
const event_handler_1 = require("./handler/event_handler");
const message_destination_handler_1 = require("./handler/message_destination_handler");
const authorization_handler_1 = require("./handler/authorization_handler");
const account_services_handler_1 = require("./handler/account_services_handler");
const sockets_state_handler_1 = require("./handler/sockets_state_handler");
const authorizer_1 = require("./authorizer");
class ServerController {
    constructor() {
        // TODO refactor into new class 
        this._messageDestinationHandler = new message_destination_handler_1.MessageDestinationHandler();
        this._authorizationHandler = new authorization_handler_1.AuthorizationHandler(this._messageDestinationHandler);
        this._account = new account_1.Account(10, new account_repository_1.AccountRepository());
        this._accountServicesHandler = new account_services_handler_1.AccountServicesHandler(this._account, this._messageDestinationHandler);
        this._eventToMsg = new Map();
        this._eventToMsg.set('signIn', this._accountServicesHandler);
        this._eventToMsg.set('signUp', this._accountServicesHandler);
        this._eventToMsg.set('changePassword', this._accountServicesHandler);
        this._eventToMsg.set('authorize', this._authorizationHandler);
        this._eventToMsg.set('signOut', this._authorizationHandler);
        this._eventHandler = new event_handler_1.EventHandler(this._eventToMsg);
        this._socketsStateHandler = new sockets_state_handler_1.SocketsStateHandler();
        this._app = (0, express_1.default)();
        this._app.use(express_1.default.json());
        this._httpServer = http_1.default.createServer(this._app);
        this._server = new ws_1.default.Server({ server: this._httpServer });
        this._httpServer.listen(process.env.PORT, () => { console.log(`Server running on port ${process.env.PORT}`); });
        this._initializeWebsocketInfoManager();
        this._listenToConnections();
        this._API();
    }
    _initializeWebsocketInfoManager() {
        websocket_info_manager_1.WebsocketInfoManager.initialize(this._eventHandler, this._socketsStateHandler);
    }
    _listenToConnections() {
        this._server.on('connection', (client) => this._onConnection(client));
    }
    _onConnection(client) {
        websocket_info_manager_1.WebsocketInfoManager.getInstance().createWebsocketConnection(client, new authorizer_1.Authorizer(this._account));
    }
    _API() {
        // TODO refactor & create classes to validate input
        let account = new account_1.Account(10, new account_repository_1.AccountRepository());
        this._app.post('/signup', async (req, res) => {
            let msg = {
                username: req.body.username,
                password: req.body.password,
                firstName: req.body.firstName,
                lastName: req.body.lastName
            };
            return res.json(await account.signUp(msg));
        });
        this._app.post('/signin', async (req, res) => {
            let msg = {
                username: req.body.username,
                password: req.body.password,
            };
            return res.json(await account.signIn(msg));
        });
        this._app.post('/change-password', async (req, res) => {
            let msg = {
                authorizationInfo: (await account.verifyToken(req.body.token)).authorizationInfo,
                oldPassword: req.body.oldPassword,
                newPassword: req.body.newPassword,
            };
            return res.json(await account.changePassword(msg));
        });
    }
}
exports.ServerController = ServerController;
