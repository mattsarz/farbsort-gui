import QtQuick 2.0

import ".."

Rectangle {
    id: stateControl
    color: "white"

    Text {
        id:startStopTitle
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.margins: Style.smallMargin
        text: qsTr("Status")
        font.pixelSize: Style.titleFontSize
    }

}
