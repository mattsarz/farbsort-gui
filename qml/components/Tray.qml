import QtQuick 2.0
import QtQuick.Extras 1.4

Item {
    id: tray
    width: 50
    height: 150

    property bool lightbarrierInterruted: false

    Rectangle {
        id: background
        anchors.fill: parent
        color: "lightgrey"
        border.color: "black"

        StatusIndicator {
            id: status
            anchors.centerIn: parent
            color: "green"
            active:  lightbarrierInterruted
        }
    }
}
