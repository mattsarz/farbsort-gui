import QtQuick 2.5
import QtQuick.Controls 1.2
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.3

Rectangle {
    id: testControl

    property alias conveyorVelocityControl: conveyorVelocityControl

    ColumnLayout {
        anchors.fill: parent

        ToggleButton {
            id: compressorStatusButton
            text: "Compressor running"
            checked: websocketClient.compressorRunning
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
            onClicked: {
                websocketClient.sendCompressorRunningRequest(!websocketClient.compressorRunning)
            }


        }

        Text {
            id: conveyorVelocityTitle
            text: qsTr("Conveyor velocity")
            font.pixelSize: 12
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
        }

        Slider {
            id: conveyorVelocityControl
            minimumValue: 0.5
            maximumValue: 2
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
        }

        Text {
            id: simulationControlTitle
            text: qsTr("Test ejectors")
            font.pixelSize: 12
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
        }

        Button {
            id: pushEjectorOneButton
            text: qsTr("Push ejectort #1")
            enabled: simulator.ejectorOne.state === "idle" && websocketClient.compressorRunning
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
            onClicked: { websocketClient.ejectValve(1) }
        }

        Button {
            id: pushEjectorTwoButton
            text: qsTr("Push ejectort #2")
            enabled: simulator.ejectorTwo.state === "idle" && websocketClient.compressorRunning
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
            onClicked: { websocketClient.ejectValve(2) }
        }

        Button {
            id: pushEjectorThreeButton
            text: qsTr("Push ejectort #3")
            enabled: simulator.ejectorThree.state === "idle" && websocketClient.compressorRunning
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
            onClicked: { websocketClient.ejectValve(3) }
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
