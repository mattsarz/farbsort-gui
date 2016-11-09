import QtQuick 2.5
import QtQuick.Controls 1.2
import QtQuick.Extras 1.4

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
        anchors.horizontalCenter: parent
        minimumValue: 0.5
        maximumValue: 2
    }

    Button {
        x: 873
        y: 195
        text: qsTr("Push ejectort #1")
        onClicked: {
            simulator.conveyorRunning = !simulator.conveyorRunning;

            if(simulator.ejectorState != "ejecting") {
                simulator.ejectorState = "ejecting"
            } else {
                simulator.ejectorState = "idle"
            }

            console.log("running = " + simulator.conveyorRunning)
        }
u
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
}
