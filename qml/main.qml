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
        url: "ws://10.0.1.12"

        onTextMessageReceived: {
            messageBox.text = messageBox.text + "\nReceived message: " + message
        }

        onStatusChanged: {
            if (websocket.status == WebSocket.Error) {
                console.log("Error: " + websocket.errorString)
            } else if (websocket.status == WebSocket.Open) {
                websocket.sendTextMessage("motor.start")
            } else if (websocket.status == WebSocket.Closed) {
                ui.statusText.text += "\nWebsocked closed"
            }
        }
        active: false
    }

    MainForm {
        id: ui
        anchors.fill: parent
        startButton.onClicked: {
            websocket.active =  !websocket.active;
            console.log(qsTr('Clicked on startButton.'))
        }

    }
}
