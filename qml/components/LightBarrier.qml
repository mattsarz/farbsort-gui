import QtQuick 2.0

Rectangle {
    id: lightBarrier
    property bool active: false
    property alias stoneColor: stone.color

    color: "transparent"
    border.color: "gray"

    Image {
        id: lightSender
        source: active ? "qrc:/lightbarrier_sender_pressed.png" : "qrc:/lightbarrier_sender_default.png"
        anchors.top:   parent.top
        anchors.left:  parent.left
        anchors.right: parent.right
    }

    Image {
        id: lightBeam
        source: active ? "qrc:/lightbarrier_beam_pressed.png" : "qrc:/lightbarrier_beam_default.png"
        anchors.top:    lightSender.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: lightReceiver.top

        Stone {
            id: stone
            visible: lightBarrier.active
            width: lightBarrier.width * 0.9
            height: width
            anchors.centerIn: lightBeam
        }
    }

    Image {
        id: lightReceiver
        source: active ? "qrc:/lightbarrier_receiver_pressed.png" : "qrc:/lightbarrier_receiver_default.png"
        anchors.left:   parent.left
        anchors.right:  parent.right
        anchors.bottom: parent.bottom
    }
}
