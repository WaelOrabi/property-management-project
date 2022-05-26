"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.AccountRepository = void 0;
class AccountRepository {
    constructor() {
        this.userInfoList = [];
    }
    async getUsernameInfo(username) {
        // TODO database gateway access
        await new Promise(resolve => setTimeout(resolve, 500));
        for (const element of this.userInfoList)
            if (element.username == username)
                return element;
        return undefined;
    }
    async saveUserInfo(userInfo) {
        // TODO database gateway access
        await new Promise(resolve => setTimeout(resolve, 500));
        this.userInfoList.push(userInfo);
        return true;
    }
    async changePasswordHash(username, newHashedPassword) {
        // TODO gateway database access
        await new Promise(resolve => setTimeout(resolve, 500));
        for (const element of this.userInfoList)
            if (element.username == username)
                element.hashedPassword = newHashedPassword;
        return true;
    }
}
exports.AccountRepository = AccountRepository;
