import QtQuick 2.0

Item {
    id: lightBarrier
    property bool active: false

//    color: "transparent"
//    border.color: "gray"

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
    }

    Image {
        id: lightReceiver
        source: active ? "qrc:/lightbarrier_receiver_pressed.png" : "qrc:/lightbarrier_receiver_default.png"
        anchors.left:   parent.left
        anchors.right:  parent.right
        anchors.bottom: parent.bottom
    }
}
