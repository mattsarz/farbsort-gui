import QtQuick 2.0

Item {
    id: tray
    width: 100
    height: 150
//    color:"transparent"
//    border.color: "gray"

    property bool lightbarrierInterruted: false
    property alias trayColor: trayRect.color

    Rectangle {
        id: backgroundChannel
        width: parent.width*2/3
        height: parent.height
        anchors.top: parent.top
//        anchors.bottom: trayRect.top
        anchors.horizontalCenter: parent.horizontalCenter
        color: "lightgray"
    }

    Rectangle {
        id: trayRect
        color: "white"
        border.color: "lightgrey"
        border.width: 2
        radius: 4
        width: parent.width
        height: parent.width
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
    }

    LightBarrier {
        id:lightBarrier
        width: parent.width
        height: 108
        rotation: 90
        active: lightbarrierInterruted
//        anchors.horizontalCenter: parent.horizontalCenter
//        anchors.right: parent.right
        anchors.centerIn: trayRect
        stoneColor: trayColor
    }
}
