import QtQuick 2.5
import QtQuick.Window 2.2

Window {
    visible: true
    width: 1024
    height: 768
    title: qsTr("farbsort")


    WebSocketClient {
        id: websocket
    }

    MainForm {
        id: ui
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.fill: parent

        // connection status buttons
        motorStatusButton.checked: websocket.motorSwitchedOn
        motorStatusButton.onCheckedChanged: {
            websocket.motorSwitchedOn = motorStatusButton.checked
        }
        compressorStatusButton.checked: websocket.compressorSwitchedOn
        compressorStatusButton.onCheckedChanged: {
            websocket.compressorSwitchedOn = compressorStatusButton.checked
        }

        websocketConnected: websocket.connected
    }
}
