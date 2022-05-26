import { AuthorizationInfo } from "./account/account";


export type Message = {
    data: any,
    authorizationInfo?: AuthorizationInfo,
    socketId: string,
}