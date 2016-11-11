import QtQuick 2.5
import QtQuick.Controls 1.2
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.3

import "MainScreen"
import "../components"
import "../items"


Rectangle {
    id: mainScreen
    property alias motorStatusButton: motorStatusButton
    property alias compressorStatusButton: compressorStatusButton
    property bool websocketConnected: false
    anchors.fill: parent
    color: "#eeeeee"



    GridLayout{
        id: mainGrid
        rows: 6
        anchors.fill: parent

        MainTitleBar { id:mainTitle }

        Rectangle {
            id: schematicView
            color: "white"

            Layout.rowSpan: 4
        }

    }

    enabled: websocketConnected

    ToggleButton {
        id: motorStatusButton
        x: 880
        y: 8
        text: "Motor running"
    }

    ToggleButton {
        id: compressorStatusButton
        x: 700
        y: 8
        text: "Compressor running"
    }

    Slider {
        id: conveyorVelocityControl
        x: 861
        y: 148
        width: 131
        height: 22
        minimumValue: 0.5
        maximumValue: 2
    }

    Button {
        id: pushEjectorOneButton
        x: 873
        y: 219
        text: qsTr("Push ejectort #1")
        enabled: simulator.ejectorOne.state === "idle" && compressorStatusButton.checked
        onClicked: simulator.ejectorOne.eject()
    }

    Button {
        id: pushEjectorTwoButton
        x: 873
        y: 247
        text: qsTr("Push ejectort #2")
        enabled: simulator.ejectorTwo.state === "idle" && compressorStatusButton.checked
        onClicked: simulator.ejectorTwo.eject()
    }

    Button {
        id: pushEjectorThreeButton
        x: 873
        y: 275
        text: qsTr("Push ejectort #3")
        enabled: simulator.ejectorThree.state === "idle" && compressorStatusButton.checked
        onClicked: simulator.ejectorThree.eject()
    }

    Simulator {
        id: simulator
        x: 0
        y: 0
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

    Text {
        id: simulationControlTitle
        x: 869
        y: 193
        text: qsTr("Simulation controls")
        font.pixelSize: 12
    }
}
