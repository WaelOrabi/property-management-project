import { Account, ChangePasswordMessage, ChangePasswordReply, SignInMessage, SignInReply, SignUpMessage, SignUpReply } from "../account/account";
import { Message } from "../message";
import { MessageDestinationHandler } from "./message_destination_handler";
import { MessageHandler } from "./message_handler";

type ErrorData = {
    event: string,
    error: string,
    successful: boolean,
}
export class AccountServicesHandler implements MessageHandler {
    private _account: Account;
    private _messageDestinationHandler: MessageDestinationHandler
    constructor(account: Account, _messageDestinationHandler: MessageDestinationHandler) {
        this._account = account
        this._messageDestinationHandler = _messageDestinationHandler

    }
    public handle(message: Message): void {
        switch (message.data.event) {
            case 'signIn':
                this._handleSignIn(message)
                break;
            case 'signUp':
                this._handleSignUp(message)
                break;
            case 'changePassword':
                this._handleChangePassword(message)
                break;
        }
    }
    private async _handleSignIn(message: Message): Promise<void> {
        let signInMessage: SignInMessage | undefined = this._toSignInMessage(message)
        if (signInMessage === undefined) {
            let errorData: ErrorData = { event: message.data.event, error: "Missing username/password.", successful: false }
            message.data = errorData
            this._messageDestinationHandler.handle(message)
            return
        }

        let signInReply: SignInReply = await this._account.signIn(signInMessage)
        if (signInReply.successful === false) {
            let errorData: ErrorData = { event: message.data.event, error: signInReply.error!, successful: false }
            message.data = errorData
            this._messageDestinationHandler.handle(message)
        }
        else {
            message.data.token = signInReply.token
            message.data.successful = true
            this._messageDestinationHandler.handle(message)
        }
    }
    private _toSignInMessage(message: Message): SignInMessage | undefined {
        let data: any = message.data
        if (this._has(data, 'password') && this._has(data, 'username'))
            return { username: message.data.username, password: message.data.password }
        return undefined
    }
    private async _handleSignUp(message: Message): Promise<void> {
        let signUpMessage: SignUpMessage | undefined = this._toSignUpMessage(message)
        if (signUpMessage === undefined) {
            let errorData: ErrorData = { event: message.data.event, error: "Missing firstName/lastName/username/password.", successful: false }
            message.data = errorData
            this._messageDestinationHandler.handle(message)
            return
        }
        let signUpReply: SignUpReply = await this._account.signUp(signUpMessage)
        if (signUpReply.successful === false) {
            let errorData: ErrorData = { event: message.data.event, error: signUpReply.error!, successful: false }
            message.data = errorData
            this._messageDestinationHandler.handle(message)
        }
        else {
            message.data.successful = signUpReply.successful
            this._messageDestinationHandler.handle(message)
        }

    }
    private _toSignUpMessage(message: Message): SignUpMessage | undefined {
        let data: any = message.data
        if (this._has(data, 'firstName') && this._has(data, 'lastName') && this._has(data, 'username') && this._has(data, 'password'))
            return { firstName: data.firstName, lastName: data.lastName, username: data.username, password: data.password }
        return undefined
    }
    private async _handleChangePassword(message: Message): Promise<void> {
        let changePasswordMessage: ChangePasswordMessage | undefined = this._toChangePasswordMessage(message)
        if (changePasswordMessage === undefined) {
            let errorData: ErrorData = { event: message.data.event, error: "Missing authorizationInfo/oldPassword/newPassword.", successful: false }
            message.data = errorData
            this._messageDestinationHandler.handle(message)
            return
        }
        let changePasswordReply: ChangePasswordReply = await this._account.changePassword(changePasswordMessage)
        if (changePasswordReply.successful === false) {
            let errorData: ErrorData = { event: message.data.event, error: changePasswordReply.error!, successful: false }
            message.data = errorData
            this._messageDestinationHandler.handle(message)
        }
        else {
            message.data.successful = changePasswordReply.successful
            this._messageDestinationHandler.handle(message)
        }
    }
    private _toChangePasswordMessage(message: Message): ChangePasswordMessage | undefined {
        let data: any = message.data
        if (message.authorizationInfo !== undefined && this._has(data, 'oldPassword') && this._has(data, 'newPassword'))
            return { authorizationInfo: message.authorizationInfo, oldPassword: data.oldPassword, newPassword: data.newPassword }
        return undefined
    }
    private _has(parentProperty: any, childProperty: string): boolean {
        return parentProperty.hasOwnProperty(childProperty)
    }


}