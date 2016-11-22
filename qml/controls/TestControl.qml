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
            font.pixelSize: Style.titleFontSize
        }

        Button {
            id: pneumaticPumpButton
            checkable: true
            scale: checked ? 0.95 : 1.0
            text: checked ? qsTr("Peumatik") + " " + qsTr("aus") : qsTr("Peumatik") + " " + qsTr("ein")
            font.pixelSize: Style.controlFontSize

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
            enabled: simulator.ejectorOne.state === "idle" && websocketClient.compressorRunning
            onPressed: scale=0.95
            onReleased: scale=1.0

            Layout.preferredHeight: parent.height/14
            Layout.preferredWidth: parent.width
            Layout.alignment: Qt.AlignTop | Qt.AlignLeft

            onClicked: { websocketClient.ejectValve(1) }
        }

        Button {
            id: pushEjectorTwoButton
            text: "A2" + " " + qsTr("Ausstosser")
            enabled: simulator.ejectorTwo.state === "idle" && websocketClient.compressorRunning
            onPressed: scale=0.95
            onReleased: scale=1.0

            Layout.preferredHeight: parent.height/14
            Layout.preferredWidth: parent.width
            Layout.alignment: Qt.AlignTop | Qt.AlignLeft

            onClicked: { websocketClient.ejectValve(2) }
        }

        Button {
            id: pushEjectorThreeButton
            text: "A3" + " " + qsTr("Ausstosser")
            enabled: simulator.ejectorThree.state === "idle" && websocketClient.compressorRunning
            onPressed: scale=0.95
            onReleased: scale=1.0

            Layout.preferredHeight: parent.height/14
            Layout.preferredWidth: parent.width
            Layout.alignment: Qt.AlignTop | Qt.AlignLeft

            onClicked: { websocketClient.ejectValve(3) }
        }

        Button {
            id: pushAllEjectorButton
            text: "Alle" + " " + qsTr("Ausstosser")
            enabled: simulator.ejectorThree.state === "idle" && websocketClient.compressorRunning
            onPressed: scale=0.95
            onReleased: scale=1.0

            Layout.preferredHeight: parent.height/14
            Layout.preferredWidth: parent.width
            Layout.alignment: Qt.AlignTop | Qt.AlignLeft

            onClicked: { websocketClient.ejectValve(1);websocketClient.ejectValve(2);websocketClient.ejectValve(3) }
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
            checkable: true
            scale: checked ? 0.95 : 1.0
            text: checked ? qsTr("Förderband") + " " + qsTr("aus") : qsTr("Förderband") + " " + qsTr("ein")
            font.pixelSize: Style.controlFontSize

            Layout.preferredHeight: parent.height/14
            Layout.preferredWidth: parent.width
            Layout.alignment: Qt.AlignTop | Qt.AlignLeft

            onClicked: {
                websocketClient.sendMotorRunningRequest(!websocketClient.motorRunning)
            }
        }

        Rectangle {
            id: spacer0
            color: "red"

            Layout.preferredHeight: testControl.height
            Layout.preferredWidth: parent.width
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignTop | Qt.AlignLeft
        }

//        Button {
//            id: simulateLightbarrierOneActivated
//            visible: simulationModeActive
//            text: qsTr("Activate lightbarrier pre-color-detection")
//            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
//            onPressedChanged: { websocketClient.lightbarrierActivated(1, pressed) }
//        }

//        Button {
//            id: simulateLightbarrierTwoActivated
//            visible: simulationModeActive
//            text: qsTr("Activate lightbarrier post-color-detection")
//            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
//            onPressedChanged: { websocketClient.lightbarrierActivated(2, pressed) }
//        }

//        Button {
//            id: simulateLightbarrierThreeActivated
//            visible: simulationModeActive
//            text: qsTr("Activate lightbarrier Tray #1")
//            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
//            onPressedChanged: { websocketClient.lightbarrierActivated(3, pressed) }
//        }

//        Button {
//            id: simulateLightbarrierFourActivated
//            visible: simulationModeActive
//            text: qsTr("Activate lightbarrier Tray #2")
//            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
//            onPressedChanged: { websocketClient.lightbarrierActivated(4, pressed) }
//        }

//        Button {
//            id: simulateLightbarrierFiveActivated
//            visible: simulationModeActive
//            text: qsTr("Activate lightbarrier Tray #3")
//            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
//            onPressedChanged: { websocketClient.lightbarrierActivated(5, pressed) }
//        }

//        RowLayout {
//            Repeater {
//                model: ["white", "blue", "red", "transparent"]

//                Button {
//                    text: modelData
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
//                    onClicked: {
//                        websocketClient.sendDetectedColor(modelData)
//                    }
//                }
//            }
//        }
    }
}
