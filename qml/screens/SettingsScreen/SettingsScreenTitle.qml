import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4

import "../.."

Rectangle {
    id: settingsScreenTitle
    color: "transparent"//"green" //
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top

    property alias diagnosticButton: diagnosticButton
    property alias configurationButton: configurationButton

    signal exitClicked
    signal buttonClicked(var button)

    Button{
        id: exitButton

        width: exitButton.height
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: Style.bigMargin+ Style.smallMargin
        anchors.rightMargin: Style.bigMargin
        z: 12

        background: Rectangle{
            color: "transparent"
        }

        Image {
            source: "qrc:/cancelmark.png"
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
        }

        onPressed: scale  = 0.8
        onReleased: scale = 1.0

        onClicked: {
            exitClicked();
        }
    }

    ButtonGroup {
        id: buttonGroup
        buttons: rowLayout.children
        checkedButton: diagnosticButton

        onCheckedButtonChanged: {
            buttonClicked(buttonGroup.checkedButton)
        }
    }

    RowLayout {
        id: rowLayout
        anchors.left: parent.left
        anchors.margins: Style.bigMargin
        anchors.right: exitButton.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        spacing: 0

        Button{
            id: diagnosticButton
            checkable: true
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.margins: 0
            text: qsTr("Diagnose")
            property int buttonId: 0
            font.pixelSize: Style.controlFontSize

            background: Rectangle {
                anchors.fill: parent
                color: diagnosticButton.checked ? "#db5800" : "#e0e4e6"
            }

            Layout.fillHeight: true
            Layout.preferredWidth: parent.width/6
            Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
            Layout.margins: 0
        }

        Button{
            id: configurationButton
            checkable: true
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.margins: 0
            text: qsTr("KONFIGURATION")
            property int buttonId: 1
            font.pixelSize: Style.controlFontSize

            background: Rectangle {
                anchors.fill: parent
                color: configurationButton.checked ? "#db5800" : "#e0e4e6"
            }

            Layout.fillHeight: true
            Layout.preferredWidth: parent.width/6
            Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
            Layout.margins: 0
        }

        Item{
            id: spacer

            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredWidth: parent.width/6

            Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
            Layout.margins: 0
        }
    }
}
