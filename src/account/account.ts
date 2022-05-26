import { AccountRepository } from "./account_repository";
import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken'
import { Reply } from "../reply";

export type SignInMessage = {
    username: string,
    password: string,
}
export type SignInReply = Reply & {
    token?: string,
}
export type SignUpMessage = {
    username: string,
    password: string,
    firstName: string,
    lastName: string,
}
export type SignUpReply = Reply

export type ChangePasswordMessage = {
    authorizationInfo: AuthorizationInfo,
    oldPassword: string,
    newPassword: string,
}
export type ChangePasswordReply = Reply
export type UserInfo = {
    username: string,
    hashedPassword: string,
    firstName: string,
    lastName: string,
    permission: string,
}
export type AuthorizationInfo = {
    username: string,
    permission: string,
}
export type AuthorizationInfoReply = Reply & { authorizationInfo?: AuthorizationInfo }

export class Account {
    private _bcryptCycles: number;
    private _accountRepository: AccountRepository;
    private DEFAULT_JWT_SECRET: string = 'HELLOWORLD1234helloworld1234'
    constructor(bcyrptCycles: number, accountRepository: AccountRepository) {
        this._accountRepository = accountRepository
        this._bcryptCycles = bcyrptCycles
    }

    async signUp(signUpMessage: SignUpMessage): Promise<SignUpReply> {
        if ((await this._accountRepository.getUsernameInfo(signUpMessage.username)) === undefined) {
            // TODO validate username/password lengths 
            
            let userInfo: UserInfo = {
                username: signUpMessage.username,
                hashedPassword: await bcrypt.hash(signUpMessage.password, this._bcryptCycles),
                firstName: signUpMessage.firstName,
                lastName: signUpMessage.lastName,
                permission: 'basic'
            }
            let successful = await this._accountRepository.saveUserInfo(userInfo)
            if (!successful)
                return { successful, error: 'unknown error' }

            else return { successful }
        }
        else {
            return { successful: false, error: 'username already exists' }
        }

    }

    async signIn(signInMessage: SignInMessage): Promise<SignInReply> {
        let userInfo: UserInfo | undefined = await this._accountRepository.getUsernameInfo(signInMessage.username)
        if (userInfo === undefined)
            return { successful: false, error: 'Username not found.' }

        else {
            if (await bcrypt.compare(signInMessage.password, userInfo.hashedPassword)) {
                const token: string = jwt.sign(
                    {
                        username: userInfo.username,
                        permission: userInfo.permission,
                    },
                    process.env.JWT_SECRET === undefined ? this.DEFAULT_JWT_SECRET : process.env.JWT_SECRET,
                )
                return { successful: true, token: token }
            }
            else {
                return { successful: false, error: 'Wrong password.' }
            }
        }
    }

    async changePassword(changePasswordMessage: ChangePasswordMessage): Promise<ChangePasswordReply> {

        let userInfo: UserInfo | undefined = await this._accountRepository.getUsernameInfo(changePasswordMessage.authorizationInfo.username)
        if (userInfo === undefined)
            return { successful: false, error: 'Username not found.' }

        else {
            if (await bcrypt.compare(changePasswordMessage.oldPassword, userInfo.hashedPassword)) {
                let successful = await this._accountRepository.changePasswordHash(userInfo.username,
                    await bcrypt.hash(changePasswordMessage.newPassword, this._bcryptCycles))
                if (!successful)
                    return { successful, error: 'Unknown error.' }
                else
                    return { successful }
            }
            else {
                return { successful: false, error: 'Wrong password.' }
            }
        }
    }
    async verifyToken(token: string): Promise<AuthorizationInfoReply> {
        try {
            let jwtInfo: any = jwt.verify(token, process.env.JWT_SECRET === undefined ? this.DEFAULT_JWT_SECRET : process.env.JWT_SECRET)
            return { successful: true, authorizationInfo: { username: jwtInfo.username, permission: jwtInfo.permission } }
        }
        catch (error) {
            return { successful: false, error: 'Errornous token.' }
        }
    }
}