"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Authorizer = void 0;
class Authorizer {
    constructor(account) {
        this._authorized = false;
        this._authorizationInfo = { username: '', permission: '' };
        this._account = account;
    }
    addExistingAuthorizationInfo(message) {
        if (this.isAuthorized()) {
            message.authorizationInfo = this.authorizationInfo;
            return true;
        }
        return false;
    }
    isAuthorized() {
        return this._authorized;
    }
    async authorize(authorizationRequestMessage) {
        let reply = await this._account.verifyToken(authorizationRequestMessage.token);
        if (reply.successful) {
            this._authorized = true;
            this._authorizationInfo = reply.authorizationInfo;
            return { successful: reply.successful };
        }
        return { successful: reply.successful, error: reply.error };
    }
    get authorizationInfo() {
        return this._authorizationInfo;
    }
    disableAuthorization() {
        this._authorized = false;
        this._authorizationInfo = { username: '', permission: '' };
    }
}
exports.Authorizer = Authorizer;
