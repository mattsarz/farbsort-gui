import QtQuick 2.5
import QtQuick.Layouts 1.3

Rectangle {
    id: startStopControl
    color: "white"

    property alias title: startStopTitle.text

    signal buttonToggled(bool state)

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 12
        spacing: 12

        Text {
            id:startStopTitle
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredHeight: parent/2
            Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
            text: "Steuerung"
            font.pixelSize: 30
        }

        ToggleButton {
            id: startStopButton
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredHeight: parent/2
            Layout.alignment: Qt.AlignCenter
        }
    }
}
