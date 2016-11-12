import QtQuick 2.0
import Qt.WebSockets 1.0

Item {
    id: client
    property bool connected: false


    WebSocket {
        id: websocket
        url: "ws://" + applicationConfig.ipAddress() + ":8888/ws"

        onStatusChanged: {
            if (websocket.status == WebSocket.Error) {
                console.log("Error: " + websocket.errorString)
            } else if (websocket.status == WebSocket.Open) {
                console.log("Websocket opened");
                sendTextMessage("")
            } else if (websocket.status == WebSocket.Closed) {
                console.log("Websocked closed");
            }

            connected = (websocket.status == WebSocket.Open)
            console.log("connected state: " + connected)
        }
        active: true
    }
}
