import QtQuick 2.0
import QtQuick.Layouts 1.3

import ".."

Rectangle {
    id: legendRect
    color: "white"
    height:200
    width: 400

    Text {
        id:startStopTitle
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.margins: Style.smallMargin
        text: qsTr("Legende")
        color: Style.textColor
        font.pixelSize: Style.titleFontSize
    }

    LegendContent{
        id: content

        anchors.top: startStopTitle.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: Style.bigMargin
    }
}
