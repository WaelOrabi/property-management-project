"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.Account = void 0;
const bcrypt_1 = __importDefault(require("bcrypt"));
const jsonwebtoken_1 = __importDefault(require("jsonwebtoken"));
class Account {
    constructor(bcyrptCycles, accountRepository) {
        this.DEFAULT_JWT_SECRET = 'HELLOWORLD1234helloworld1234';
        this._accountRepository = accountRepository;
        this._bcryptCycles = bcyrptCycles;
    }
    async signUp(signUpMessage) {
        if ((await this._accountRepository.getUsernameInfo(signUpMessage.username)) === undefined) {
            // TODO validate username/password lengths 
            let userInfo = {
                username: signUpMessage.username,
                hashedPassword: await bcrypt_1.default.hash(signUpMessage.password, this._bcryptCycles),
                firstName: signUpMessage.firstName,
                lastName: signUpMessage.lastName,
                permission: 'basic'
            };
            let successful = await this._accountRepository.saveUserInfo(userInfo);
            if (!successful)
                return { successful, error: 'unknown error' };
            else
                return { successful };
        }
        else {
            return { successful: false, error: 'username already exists' };
        }
    }
    async signIn(signInMessage) {
        let userInfo = await this._accountRepository.getUsernameInfo(signInMessage.username);
        if (userInfo === undefined)
            return { successful: false, error: 'Username not found.' };
        else {
            if (await bcrypt_1.default.compare(signInMessage.password, userInfo.hashedPassword)) {
                const token = jsonwebtoken_1.default.sign({
                    username: userInfo.username,
                    permission: userInfo.permission,
                }, process.env.JWT_SECRET === undefined ? this.DEFAULT_JWT_SECRET : process.env.JWT_SECRET);
                return { successful: true, token: token };
            }
            else {
                return { successful: false, error: 'Wrong password.' };
            }
        }
    }
    async changePassword(changePasswordMessage) {
        let userInfo = await this._accountRepository.getUsernameInfo(changePasswordMessage.authorizationInfo.username);
        if (userInfo === undefined)
            return { successful: false, error: 'Username not found.' };
        else {
            if (await bcrypt_1.default.compare(changePasswordMessage.oldPassword, userInfo.hashedPassword)) {
                let successful = await this._accountRepository.changePasswordHash(userInfo.username, await bcrypt_1.default.hash(changePasswordMessage.newPassword, this._bcryptCycles));
                if (!successful)
                    return { successful, error: 'Unknown error.' };
                else
                    return { successful };
            }
            else {
                return { successful: false, error: 'Wrong password.' };
            }
        }
    }
    async verifyToken(token) {
        try {
            let jwtInfo = jsonwebtoken_1.default.verify(token, process.env.JWT_SECRET === undefined ? this.DEFAULT_JWT_SECRET : process.env.JWT_SECRET);
            return { successful: true, authorizationInfo: { username: jwtInfo.username, permission: jwtInfo.permission } };
        }
        catch (error) {
            return { successful: false, error: 'Errornous token.' };
        }
    }
}
exports.Account = Account;
