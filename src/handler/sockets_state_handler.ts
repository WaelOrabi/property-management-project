import { SocketStateInfo } from "../websocket_info_manager";

export class SocketsStateHandler implements Handler<SocketStateInfo> {
    handle(socketStateHandler: SocketStateInfo): void {
        console.log(socketStateHandler)
    }
}