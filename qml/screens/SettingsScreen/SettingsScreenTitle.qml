import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

import "../.."

Item {
    id: settingsScreenTitle
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top
    anchors.margins: Style.bigMargin
    property alias diagnosticButton: diagnosticButton
    property alias configurationButton: configurationButton

    signal exitClicked
    signal buttonClicked(var button)

    Button{
        id: exitButton
        height: 28
        width: height
        anchors.right: parent.right
        anchors.top: parent.top
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
            console.log("Checked button: " + buttonGroup.checkedButton.text)
        }
    }

    RowLayout {
        id: rowLayout
        anchors.left: parent.left
        anchors.right: exitButton.right
        anchors.rightMargin: Style.bigMargin
        spacing: 0

        Button{
            id: diagnosticButton
            checkable: true
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.margins: 0
            text: qsTr("DIAGNOSE")
            property int buttonId: 0

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
