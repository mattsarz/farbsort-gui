import QtQuick 2.0

Item {
    id: tray
    width: 100
    height: 150
//    color:"transparent"
//    border.color: "gray"

    property bool lightbarrierInterruted: false
    property alias trayColor: trayRect.color
    property int trayRectVerticalMiddle: trayRect.y + trayRect.height / 2

    Rectangle {
        id: backgroundChannel
        width: parent.width/3
        anchors.top: parent.top
        anchors.bottom: trayRect.top
        anchors.horizontalCenter: parent.horizontalCenter
        color: "lightgray"
    }

    Rectangle {
        id: trayRect
        color: "white"
        border.color: "lightgrey"
        border.width: 2
        radius: 4
        width: 1.4*parent.width/3
        height: width
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
    }

    LightBarrier {
        id:lightBarrier
        width: 1.5*parent.width/6
        height: parent.width
        rotation: 90
        active: lightbarrierInterruted
//        anchors.horizontalCenter: parent.horizontalCenter
//        anchors.right: parent.right
        anchors.centerIn: trayRect
    }
}
