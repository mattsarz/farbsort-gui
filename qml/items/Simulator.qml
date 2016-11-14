import QtQuick 2.0
import QtQuick.Extras 1.4

import "../components"

Rectangle {
    id: simulator
//    width: 610
//    height: 450
    color: "white"

    property alias conveyor: conveyor
    property alias ejectorOne: ejectorOne
    property alias ejectorTwo: ejectorTwo
    property alias ejectorThree: ejectorThree
    property bool  lightbarrierBeforeColorDetectionState: false
    property bool  lightbarrierAfterColorDetectionState: false
    property alias lightbarrierTrayOne: lightbarrierTrayOne
    property alias lightbarrierTrayTwo: lightbarrierTrayTwo
    property alias lightbarrierTrayThree: lightbarrierTrayTree
    signal valveEjected(int number)

    onValveEjected: {
        switch(number) {
            case 1:  {
                ejectorOne.eject()
            } break;
            case 2:  {
                ejectorTwo.eject()
            } break;
            case 3:  {
                ejectorThree.eject()
            } break;
        }
    }

    Conveyor {
        id: conveyor
        x: 0
        y: 150
    }

    Ejector {
        id: ejectorOne
        x: 300
        y: 0
    }

    Ejector {
        id: ejectorTwo
        x: 400
        y: 0
    }

    Ejector {
        id: ejectorThree
        x: 500
        y: 0
    }

    StatusIndicator {
        id: lightbarrierBeforeColorDetection
        x: 100
        y: 310
        color: "green"
        active:  lightbarrierBeforeColorDetectionState
    }

    StatusIndicator {
        id: lightbarrierAfterColorDetection
        x: 200
        y: 310
        color: "green"
        active:  lightbarrierAfterColorDetectionState
    }

    Tray {
        id: lightbarrierTrayOne
        y: 300
        x: 300
    }

    Tray {
        id: lightbarrierTrayTwo
        y: 300
        x: 400
    }

    Tray {
        id: lightbarrierTrayTree
        y: 300
        x: 500
    }
}
