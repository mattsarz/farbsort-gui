import QtQuick 2.5
import QtQuick.Controls 1.2
import QtQuick.Extras 1.4

import ".."

Rectangle {
    property alias motorStatusButton: motorStatusButton

    width: 1000
    height: 480

    ToggleButton {
        id: motorStatusButton
        x: 880
        y: 8
        text: "Motor running"
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
        enabled: simulator.ejectorOne.state === "idle"
        onClicked: simulator.ejectorOne.eject()
    }

    Button {
        id: pushEjectorTwoButton
        x: 873
        y: 247
        text: qsTr("Push ejectort #2")
        enabled: simulator.ejectorTwo.state === "idle"
        onClicked: simulator.ejectorTwo.eject()
    }

    Button {
        id: pushEjectorThreeButton
        x: 873
        y: 275
        text: qsTr("Push ejectort #3")
        enabled: simulator.ejectorThree.state === "idle"
        onClicked: simulator.ejectorThree.eject()
    }

    Simulator {
        id: simulator
        x: 0
        y: 0
        conveyorVelocity: conveyorVelocityControl.value
        conveyorRunning: motorStatusButton.checked

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
