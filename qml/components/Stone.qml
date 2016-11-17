import QtQuick 2.0

Item {
    id: stone
    property alias color: circle.color

    Rectangle {
        id: circle
        anchors.fill: parent
        radius: 90
        color: "red"
        border.color: "black"
        border.width: parent.width * 0.05
    }

}
