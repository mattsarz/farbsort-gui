import QtQuick 2.0

Item {
    id: simulator
    width: 800
    height: 400

    property alias conveyorRunning: conveyor.running
    property alias conveyorVelocity: conveyor.velocity
    property alias ejectorOne: ejector1

    Conveyor {
        id: conveyor
        x: 30
        y: 70

        // adjust size
        transform: Scale {
            yScale: 0.75
        }
    }

    Ejector {
        id: ejector1
        x: 100
        transform: Scale {
            yScale: 0.75
            xScale: 0.75
        }
    }
}
