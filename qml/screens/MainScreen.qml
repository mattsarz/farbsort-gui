import QtQuick 2.5
import QtQuick.Controls 1.2
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.3

import "MainScreen"
import "../components"
import "../items"


Rectangle {
    id: mainScreen
    anchors.fill: parent
    width: 1024
    height: 768
    color: "#eeeeee"

    property alias motorStatusButton: motorStatusButton
    property alias compressorStatusButton: compressorStatusButton
    property bool websocketConnected: false

    GridLayout{
        id: mainGrid
        columns: 3
        rows: 4
        anchors.fill: parent

        MainTitleBar {
            id:mainTitle
            Layout.row: 0
            Layout.column: 0
            Layout.columnSpan: 3
            Layout.preferredHeight: parent.height * 0.1
        }

        Rectangle {
            id: schematicView
            Layout.rowSpan: 4
            color: "white"
        }

        Simulator {
            id: simulator
            Layout.row: 1
            Layout.column: 0
            Layout.rowSpan: 2
            Layout.columnSpan: 2
            Layout.preferredHeight: parent.height * 0.5
            Layout.preferredWidth: parent.width * 0.75
            conveyor.velocity: conveyorVelocityControl.value
            conveyor.running: motorStatusButton.checked
            lightbarrierBeforeColorDetectionState: websocket.lightBarrierOneInterrupted
            lightbarrierAfterColorDetectionState: websocket.lightBarrierTwoInterrupted
            lightbarrierTrayOne.lightbarrierInterruted: websocket.lightBarrierThreeInterrupted
            lightbarrierTrayTwo.lightbarrierInterruted: websocket.lightBarrierFourInterrupted
            lightbarrierTrayThree.lightbarrierInterruted: websocket.lightBarrierFiveInterrupted

            // todo: scale animation drawing depending on screen size
            // transform: Scale { xScale: 1.2; yScale: 1.2}
        }

    }
    enabled: websocketConnected
    ToggleButton {
        id: motorStatusButton
        x: 884
        y: 123
        text: "Motor running"
    }

    ToggleButton {
        id: compressorStatusButton
        x: 704
        y: 123
        text: "Compressor running"
    }

    Slider {
        id: conveyorVelocityControl
        x: 865
        y: 263
        width: 131
        height: 22
        minimumValue: 0.5
        maximumValue: 2
    }

    Button {
        id: pushEjectorOneButton
        x: 877
        y: 334
        text: qsTr("Push ejectort #1")
        enabled: simulator.ejectorOne.state === "idle" && compressorStatusButton.checked
        onClicked: simulator.ejectorOne.eject()
    }

    Button {
        id: pushEjectorTwoButton
        x: 877
        y: 362
        text: qsTr("Push ejectort #2")
        enabled: simulator.ejectorTwo.state === "idle" && compressorStatusButton.checked
        onClicked: simulator.ejectorTwo.eject()
    }

    Button {
        id: pushEjectorThreeButton
        x: 877
        y: 390
        text: qsTr("Push ejectort #3")
        enabled: simulator.ejectorThree.state === "idle" && compressorStatusButton.checked
        onClicked: simulator.ejectorThree.eject()
    }

    Text {
        id: simulationControlTitle
        x: 873
        y: 308
        text: qsTr("Simulation controls")
        font.pixelSize: 12
    }
}
