import QtQuick 2.0
import Qt.WebSockets 1.0

Item {
    id: client
    property bool motorSwitchedOn: false
    property bool compressorSwitchedOn: false
    readonly property bool connected: { websocket.state === WebSocket.Open }

    WebSocket {
        id: websocket
        url: "ws://10.0.1.12:8888/ws"

        onTextMessageReceived: {
            if(message == "started") {
                client.motorSwitchedOn = true;
                console.log("motor is switched on");
            } else if(message == "stopped") {
                client.motorSwitchedOn = false;
                console.log("motor is switched off");
            }
        }

        onStatusChanged: {
            if (websocket.status == WebSocket.Error) {
                console.log("Error: " + websocket.errorString)
            } else if (websocket.status == WebSocket.Open) {
                console.log("Websocket opened");
            } else if (websocket.status == WebSocket.Closed) {
                console.log("Websocked closed");
            }
        }
        active: true
    }

    onMotorSwitchedOnChanged: {
        if(motorSwitchedOn) {
            websocket.sendTextMessage("motor.start");
        } else {
            websocket.sendTextMessage("motor.stop");
        }
    }

    onCompressorSwitchedOnChanged: {
        if(compressorSwitchedOn) {
            websocket.sendTextMessage("compressor.start");
        } else {
            websocket.sendTextMessage("compressor.stop");
        }
    }
}
