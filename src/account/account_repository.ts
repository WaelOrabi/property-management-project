import { UserInfo } from "./account"

export class AccountRepository {
    private userInfoList: Array<UserInfo> = []

    async getUsernameInfo(username: string): Promise<UserInfo | undefined> {
        // TODO database gateway access
        await new Promise(resolve => setTimeout(resolve, 500))
        for (const element of this.userInfoList)
            if (element.username == username)
                return element
        return undefined

    }

    async saveUserInfo(userInfo: UserInfo): Promise<boolean> {
        // TODO database gateway access
        await new Promise(resolve => setTimeout(resolve, 500))
        this.userInfoList.push(userInfo)
        return true
    }

    async changePasswordHash(username: string, newHashedPassword: string): Promise<boolean> {
        // TODO gateway database access
        await new Promise(resolve => setTimeout(resolve, 500))
        for (const element of this.userInfoList)
            if (element.username == username)
                element.hashedPassword = newHashedPassword
        return true
    }
}