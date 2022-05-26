


import { Account, AuthorizationInfo, AuthorizationInfoReply } from "./account/account"
import { Message } from "./message"

export type AuthorizationRequestMessage = {
    token: string,
}
export type AuthorizationReplyMessage = {
    successful: boolean,
    error?: string,
}


export class Authorizer {
    private _authorized: boolean = false
    private _authorizationInfo: AuthorizationInfo = { username: '', permission: '' }
    private _account: Account
    constructor(account: Account) {
        this._account = account
    }
    public addExistingAuthorizationInfo(message: Message): boolean {
        if (this.isAuthorized()) {
            message.authorizationInfo = this.authorizationInfo
            return true
        }
        return false
    }
    public isAuthorized(): boolean {
        return this._authorized
    }

    public async authorize(authorizationRequestMessage: AuthorizationRequestMessage): Promise<AuthorizationReplyMessage> {
        let reply: AuthorizationInfoReply = await this._account.verifyToken(authorizationRequestMessage.token)
        if (reply.successful) {
            this._authorized = true
            this._authorizationInfo = reply.authorizationInfo!
            return { successful: reply.successful }
        }
        return { successful: reply.successful, error: reply.error }
    }
    public get authorizationInfo(): AuthorizationInfo {
        return this._authorizationInfo
    }
    public disableAuthorization(): void {
        this._authorized = false
        this._authorizationInfo = { username: '', permission: '' }
    }

}   
