import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 2.0

import "items"
import "screens"

//Window {
//    visible: true
//    width: 1024
//    height: 768
//    title: qsTr("farbsort")


//    WebSocketClient {
//        id: websocket
//    }

//    MainScreen {
//        id: ui
//        anchors.rightMargin: 0
//        anchors.bottomMargin: 0
//        anchors.leftMargin: 0
//        anchors.topMargin: 0
//        anchors.fill: parent
//    }
//}

ApplicationWindow {
    title: qsTr("Hello World")
    width: 1024
    height: 768
    visible: true

    WebSocketClient {
        id: websocket
    }

    MainScreen {
        id: mainScreen
        anchors.fill: stackView
        websocketConnected: websocket.connected
    }

    ListModel {
        id: pageModel
        ListElement {
            title: "Mainscreen"
            page: "screens/MainScreen.qml"
        }
        ListElement {
            title: "SettingsScreen"
            page: "screens/SettingsScreen.qml"
        }
        ListElement {
            title: "DiagnosticScreen"
            page: "screens/DiagnosticScreen.qml"
        }
    }

    StackView {
        id: stackView
        initialItem: mainScreen
        anchors.fill: parent
        z:1

        pushEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to:1
                duration: 400
            }
        }
        pushExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to:0
                duration: 400
            }
        }
        popEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to:1
                duration: 400
            }
        }
        popExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to:0
                duration: 400
            }
        }
    }

//    Row {
//        spacing: 10

//        Button {
//            text: "Push"
//            onClicked: stack.push(mainView)
//        }
//        Button {
//            text: "Pop"
//            enabled: stack.depth > 1
//            onClicked: stack.pop()

//        }
//        Text {
//            text: stack.depth
//        }
//    }
}
