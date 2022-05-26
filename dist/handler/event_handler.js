"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.EventHandler = void 0;
class EventHandler {
    constructor(messageToHandler) {
        this._messageToHandler = messageToHandler;
    }
    handle(message) {
        if (message.data.hasOwnProperty('event')) {
            if (this._messageToHandler.has(message.data.event))
                this._messageToHandler.get(message.data.event)?.handle(message);
        }
    }
}
exports.EventHandler = EventHandler;
