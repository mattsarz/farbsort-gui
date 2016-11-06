import QtQuick 2.5
import QtQuick.Window 2.2
import Qt.WebSockets 1.0

Window {
    visible: true
    width: 1024
    height: 768
    title: qsTr("farbsort")

    WebSocket {
        id: websocket
        url: "ws://10.0.1.12:8888/ws"

        property bool motor_started: false

        onTextMessageReceived: {
            if(message == "started") {
                motor_started = true;
                ui.statusText.text += "\nmotor is switched on"
            } else if(message == "stopped") {
                motor_started = false;
                ui.statusText.text += "\nmotor is switched off"
            }
        }

        onStatusChanged: {
            if (websocket.status == WebSocket.Error) {
                console.log("Error: " + websocke.errorString)
            } else if (websocket.status == WebSocket.Open) {
                ui.statusText.text += "\nWebsocket opened"
            } else if (websocket.status == WebSocket.Closed) {
                ui.statusText.text += "\nWebsocked closed"
            }
        }
        active: true
    }

    MainForm {
        id: ui
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.fill: parent

        // connection buttons
        startButton.enabled: !websocket.motor_started
        stopButton.enabled: websocket.motor_started

        startButton.onClicked: {
            websocket.sendTextMessage("motor.start")
        }
        stopButton.onClicked: {
            websocket.sendTextMessage("motor.stop")
        }
    }
}
