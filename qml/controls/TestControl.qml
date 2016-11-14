import QtQuick 2.5
import QtQuick.Controls 1.2
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.3

Rectangle {
    id: testControl
    color: "red"

    property alias conveyorVelocityControl: conveyorVelocityControl

    ColumnLayout {
        anchors.fill: parent

        ToggleButton {
            id: motorStatusButton
            text: "Motor running"
            checked: websocketClient.motorRunning
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
            onClicked: { websocketClient.toggleMotorRunning() }
        }

        ToggleButton {
            id: compressorStatusButton
            text: "Compressor running"
            checked: websocketClient.compressorRunning
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
            onClicked: { websocketClient.toggleCompressorRunning() }
        }

        Slider {
            id: conveyorVelocityControl
            minimumValue: 0.5
            maximumValue: 2
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
        }

        Text {
            id: simulationControlTitle
            text: qsTr("Simulate ejectors")
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
    }
}
