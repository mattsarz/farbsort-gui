import QtQuick 2.5
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3

import ".."

Rectangle {
    id: testControl

//    property alias conveyorVelocityControl: conveyorVelocityControl

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: Style.medMargin
        spacing: Style.bigMargin

        Text {
            id: manualControlTitle
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredHeight: parent.height/14
            Layout.preferredWidth: parent.width
            Layout.alignment: Qt.AlignTop | Qt.AlignLeft
            text: qsTr("Manuell")
            color: Style.textColor
            font.pixelSize: Style.titleFontSize
        }

        Button {
            id: pneumaticPumpButton
            checkable: true
            scale: checked ? 0.95 : 1.0
            checked: websocketClient.compressorRunning

            background: Rectangle{
                color: pneumaticPumpButton.checked ? Style.btnChecked : Style.btnUnchecked
                anchors.fill: parent
            }

            contentItem: Text{
                color: "white"
                text: pneumaticPumpButton.checked ? qsTr("Peumatik") + " " + qsTr("aus") : qsTr("Peumatik") + " " + qsTr("ein")
                anchors.fill: pneumaticPumpButton
                font.pixelSize: Style.controlFontSize
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            Layout.preferredHeight: parent.height/14
            Layout.preferredWidth: parent.width
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop

            onClicked: {
                websocketClient.sendCompressorRunningRequest(!websocketClient.compressorRunning)
            }
        }

        Rectangle {
            id: separator1
            color: "lightgray"

            Layout.preferredHeight: 1
            Layout.preferredWidth: parent.width
            Layout.alignment: Qt.AlignTop | Qt.AlignLeft
            Layout.topMargin: Style.smallMargin/2
            Layout.bottomMargin: Style.smallMargin/2
        }

        Button {
            id: pushEjectorOneButton
            text: "A1" + " " + qsTr("Ausstosser")
            enabled: websocketClient.compressorRunning

            background: Rectangle{
                color: pushEjectorOneButton.pressed ? Style.btnChecked : Style.btnUnchecked
                anchors.fill: parent
            }

            contentItem: Text{
                color: "white"
                text: "A1" + " " + qsTr("Ausstosser")
                anchors.fill: pushEjectorOneButton
                font.pixelSize: Style.controlFontSize
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            Layout.preferredHeight: parent.height/14
            Layout.preferredWidth: parent.width
            Layout.alignment: Qt.AlignTop | Qt.AlignLeft

            onPressed: { scale=0.95; websocketClient.sendValveStateRequest(1, true) }
            onReleased: { scale=1.0; websocketClient.sendValveStateRequest(1, false)}
            onEnabledChanged: {if(enabled) opacity=1; else opacity=0.5}
        }

        Button {
            id: pushEjectorTwoButton
            text: "A2" + " " + qsTr("Ausstosser")
            enabled: websocketClient.compressorRunning

            background: Rectangle{
                color: pushEjectorTwoButton.pressed ? Style.btnChecked : Style.btnUnchecked
                anchors.fill: parent
            }

            contentItem: Text{
                color: "white"
                text: "A2" + " " + qsTr("Ausstosser")
                anchors.fill: pushEjectorTwoButton
                font.pixelSize: Style.controlFontSize
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            Layout.preferredHeight: parent.height/14
            Layout.preferredWidth: parent.width
            Layout.alignment: Qt.AlignTop | Qt.AlignLeft

            onPressed: { scale=0.95; websocketClient.sendValveStateRequest(2, true) }
            onReleased: { scale=1.0; websocketClient.sendValveStateRequest(2, false)}
            onEnabledChanged: {if(enabled) opacity=1; else opacity=0.5}
        }

        Button {
            id: pushEjectorThreeButton
            text: "A3" + " " + qsTr("Ausstosser")
            enabled: websocketClient.compressorRunning

            background: Rectangle{
                color: pushEjectorThreeButton.pressed ? Style.btnChecked : Style.btnUnchecked
                anchors.fill: parent
            }

            contentItem: Text{
                color: "white"
                text: "A3" + " " + qsTr("Ausstosser")
                anchors.fill: pushEjectorThreeButton
                font.pixelSize: Style.controlFontSize
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            Layout.preferredHeight: parent.height/14
            Layout.preferredWidth: parent.width
            Layout.alignment: Qt.AlignTop | Qt.AlignLeft

            onPressed: { scale=0.95; websocketClient.sendValveStateRequest(3, true) }
            onReleased: { scale=1.0; websocketClient.sendValveStateRequest(3, false)}
            onEnabledChanged: {if(pushEjectorThreeButton.enabled) pushEjectorThreeButton.opacity=1; else pushEjectorThreeButton.opacity=0.5}
        }

        Button {
            id: pushAllEjectorButton
            text: "Alle" + " " + qsTr("Ausstosser")
            enabled:  websocketClient.compressorRunning
            visible: !simulationModeActive

            background: Rectangle{
                color: pushAllEjectorButton.pressed ? Style.btnChecked : Style.btnUnchecked
                anchors.fill: parent
            }

            contentItem: Text{
                color: "white"
                text: "Alle" + " " + qsTr("Ausstosser")
                anchors.fill: pushAllEjectorButton
                font.pixelSize: Style.controlFontSize
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            Layout.preferredHeight: parent.height/14
            Layout.preferredWidth: parent.width
            Layout.alignment: Qt.AlignTop | Qt.AlignLeft

            onPressed: { scale=0.95; websocketClient.sendAllValveStateRequest(true) }
            onReleased: { scale=1.0; websocketClient.sendAllValveStateRequest(false)}
            onEnabledChanged: {if(pushAllEjectorButton.enabled) pushAllEjectorButton.opacity=1; else pushAllEjectorButton.opacity=0.5}
        }

        Rectangle {
            id: separator2
            color: "lightgray"

            Layout.preferredHeight: 1
            Layout.preferredWidth: parent.width
            Layout.alignment: Qt.AlignTop | Qt.AlignLeft
            Layout.topMargin: Style.smallMargin/2
            Layout.bottomMargin: Style.smallMargin/2
        }

        Button {
            id: conveyorMotorButton
            visible: !simulationModeActive
            checkable: true
            checked: websocketClient.motorRunning
            scale: checked ? 0.95 : 1.0
            text: checked ? qsTr("Förderband") + " " + qsTr("aus") : qsTr("Förderband") + " " + qsTr("ein")
            font.pixelSize: Style.controlFontSize

            background: Rectangle{
                color: conveyorMotorButton.checked ? Style.btnChecked : Style.btnUnchecked
                anchors.fill: parent
            }

            contentItem: Text{
                color: "white"
                text: conveyorMotorButton.checked ? qsTr("Förderband") + " " + qsTr("aus") : qsTr("Förderband") + " " + qsTr("ein")
                anchors.fill: conveyorMotorButton
                font.pixelSize: Style.controlFontSize
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            Layout.preferredHeight: parent.height/14
            Layout.preferredWidth: parent.width
            Layout.alignment: Qt.AlignTop | Qt.AlignLeft

            onClicked: {
                websocketClient.sendMotorRunningRequest(!websocketClient.motorRunning)
            }
        }

        Item {
            id: spacer0
//            color: "red"

            Layout.preferredHeight: testControl.height
            Layout.preferredWidth: parent.width
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignTop | Qt.AlignLeft
        }

        RowLayout {
            Repeater {
                model: ["white", "blue", "red", "transparent"]
                Button {
                    text: modelData
                    visible: simulationModeActive
//                    style: ButtonStyle {
//                        background: Rectangle {
//                            border.width: control.activeFocus ? 2 : 1
//                            border.color: "black"
//                            implicitWidth: testControl.width / 5
//                            implicitHeight: implicitWidth / 3
//                            color: modelData
//                            radius: 4
//                        }
//                    }
                    onClicked: {
                        websocketClient.sendDetectedColor(modelData)
                    }
                }
            }
        }

        Button {
            id: simulateLightbarrierOneActivated
            visible: simulationModeActive
            text: qsTr("Activate lightbarrier pre-color-detection")
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
            onPressedChanged: { websocketClient.lightbarrierActivated(1, pressed) }
        }

        Button {
            id: simulateLightbarrierTwoActivated
            visible: simulationModeActive
            text: qsTr("Activate lightbarrier post-color-detection")
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
            onPressedChanged: { websocketClient.lightbarrierActivated(2, pressed) }
        }

        Button {
            id: simulateLightbarrierThreeActivated
            visible: simulationModeActive
            text: qsTr("Activate lightbarrier Tray #1")
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
            onPressedChanged: { websocketClient.lightbarrierActivated(3, pressed) }
        }

        Button {
            id: simulateLightbarrierFourActivated
            visible: simulationModeActive
            text: qsTr("Activate lightbarrier Tray #2")
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
            onPressedChanged: { websocketClient.lightbarrierActivated(4, pressed) }
        }

        Button {
            id: simulateLightbarrierFiveActivated
            visible: simulationModeActive
            text: qsTr("Activate lightbarrier Tray #3")
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
            onPressedChanged: { websocketClient.lightbarrierActivated(5, pressed) }
        }
    }
}
