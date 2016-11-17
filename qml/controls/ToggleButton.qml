import QtQuick 2.0
import QtQuick.Layouts 1.3

import ".."

Rectangle {
    id: root
    property color activeColor: "green"
    property color inactiveColor: "darkgreen"
    property alias textColor: text.color
    property bool active: false
    signal toggled(bool active)

    radius: 2
    color: active ? activeColor : inactiveColor
    border.width: 1

    RowLayout {
        anchors.fill: parent
        spacing: Style.smallMargin
        anchors.margins: 5

        Image {
            id: icon;
            source: active ? "qrc:/stop.png" : "qrc:/start.png"
            smooth: true
            fillMode: Image.PreserveAspectFit
            horizontalAlignment: Image.AlignRight
            verticalAlignment: Image.AlignVCenter

            Layout.alignment: Qt.AlignLeft
            Layout.preferredHeight: parent.height
            Layout.preferredWidth: parent.width/3 * 1.2
            Layout.fillHeight: true
        }

        Text {
            id: text
            color: "white"
            font.pixelSize: 18
            text: root.active ?  "STOP" : "START"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft

            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height
            Layout.preferredWidth: parent.width/3
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
        }

        Item {
            id: spacer
            width: parent.widtht/3

            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height
            Layout.preferredWidth: parent.width/3
            Layout.alignment: Qt.AlignLeft
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {root.toggled(!active) }
        onPressed: {root.scale = 0.95}
        onReleased:{root.scale = 1.0}
    }
}
