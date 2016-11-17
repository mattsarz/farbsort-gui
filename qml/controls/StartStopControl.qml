import QtQuick 2.5
import QtQuick.Layouts 1.3

import ".."

Rectangle {
    id: startStopControl
    color: "white"
    property alias active: startStopButton.active
    property alias title: startStopTitle.text

    signal buttonToggled(bool state)

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: Style.smallMargin
        spacing: 4

        Text {
            id: startStopTitle
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredHeight: parent.height/2
            Layout.preferredWidth: parent.width
            Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
            text: qsTr("Steuerung")
            font.pixelSize: Style.titleFontSize
        }

        ToggleButton {
            id: startStopButton
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredHeight: parent.height/2
            Layout.preferredWidth: parent.width
            Layout.alignment: Qt.AlignCenter

            onToggled: { buttonToggled(active) }
        }
    }
}
