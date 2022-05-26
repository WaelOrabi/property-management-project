"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.AccountServicesHandler = void 0;
class AccountServicesHandler {
    constructor(account, _messageDestinationHandler) {
        this._account = account;
        this._messageDestinationHandler = _messageDestinationHandler;
    }
    handle(message) {
        switch (message.data.event) {
            case 'signIn':
                this._handleSignIn(message);
                break;
            case 'signUp':
                this._handleSignUp(message);
                break;
            case 'changePassword':
                this._handleChangePassword(message);
                break;
        }
    }
    async _handleSignIn(message) {
        let signInMessage = this._toSignInMessage(message);
        if (signInMessage === undefined) {
            let errorData = { event: message.data.event, error: "Missing username/password.", successful: false };
            message.data = errorData;
            this._messageDestinationHandler.handle(message);
            return;
        }
        let signInReply = await this._account.signIn(signInMessage);
        if (signInReply.successful === false) {
            let errorData = { event: message.data.event, error: signInReply.error, successful: false };
            message.data = errorData;
            this._messageDestinationHandler.handle(message);
        }
        else {
            message.data.token = signInReply.token;
            message.data.successful = true;
            this._messageDestinationHandler.handle(message);
        }
    }
    _toSignInMessage(message) {
        let data = message.data;
        if (this._has(data, 'password') && this._has(data, 'username'))
            return { username: message.data.username, password: message.data.password };
        return undefined;
    }
    async _handleSignUp(message) {
        let signUpMessage = this._toSignUpMessage(message);
        if (signUpMessage === undefined) {
            let errorData = { event: message.data.event, error: "Missing firstName/lastName/username/password.", successful: false };
            message.data = errorData;
            this._messageDestinationHandler.handle(message);
            return;
        }
        let signUpReply = await this._account.signUp(signUpMessage);
        if (signUpReply.successful === false) {
            let errorData = { event: message.data.event, error: signUpReply.error, successful: false };
            message.data = errorData;
            this._messageDestinationHandler.handle(message);
        }
        else {
            message.data.successful = signUpReply.successful;
            this._messageDestinationHandler.handle(message);
        }
    }
    _toSignUpMessage(message) {
        let data = message.data;
        if (this._has(data, 'firstName') && this._has(data, 'lastName') && this._has(data, 'username') && this._has(data, 'password'))
            return { firstName: data.firstName, lastName: data.lastName, username: data.username, password: data.password };
        return undefined;
    }
    async _handleChangePassword(message) {
        let changePasswordMessage = this._toChangePasswordMessage(message);
        if (changePasswordMessage === undefined) {
            let errorData = { event: message.data.event, error: "Missing authorizationInfo/oldPassword/newPassword.", successful: false };
            message.data = errorData;
            this._messageDestinationHandler.handle(message);
            return;
        }
        let changePasswordReply = await this._account.changePassword(changePasswordMessage);
        if (changePasswordReply.successful === false) {
            let errorData = { event: message.data.event, error: changePasswordReply.error, successful: false };
            message.data = errorData;
            this._messageDestinationHandler.handle(message);
        }
        else {
            message.data.successful = changePasswordReply.successful;
            this._messageDestinationHandler.handle(message);
        }
    }
    _toChangePasswordMessage(message) {
        let data = message.data;
        if (message.authorizationInfo !== undefined && this._has(data, 'oldPassword') && this._has(data, 'newPassword'))
            return { authorizationInfo: message.authorizationInfo, oldPassword: data.oldPassword, newPassword: data.newPassword };
        return undefined;
    }
    _has(parentProperty, childProperty) {
        return parentProperty.hasOwnProperty(childProperty);
    }
}
exports.AccountServicesHandler = AccountServicesHandler;
