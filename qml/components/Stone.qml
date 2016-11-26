import QtQuick 2.0

Item {
    id: stoneObject
    state: "created"
    property alias color: circle.color
    property int startPosX: 16

    property int startPosY: parent.height/2 - stoneObject.height/2
    property int stopPosY: startPosY + 100
    property int conveyorSpeed: 800
    property int lightbarrierAfterDetectorXPos: 300
    property int trayId: 0
    property int destinationXPos: 300

    signal trayReached(int trayId)

    function startDetection() {
        stoneObject.x = stoneObject.startPosX
        stoneObject.y = stoneObject.startPosY
        stoneObject.color = "transparent"
        state = "detecting"
    }

    function startEjecting(trayId) {
        if(trayId === stoneObject.trayId) {
            if("moving" === state) {
                state = "moved"
            }
            if("moved" === state && needsEjection()) {
                state = "ejecting"
            }
        }
    }

    function moveConveyor() {
        updateConveyorAnimationTime()
        if("detecting" === state) {
            state = "detected"
        }
        if("detected" === state) {
            state = "moving"
        }
    }

    function onColorDetected(color, trayId, destinationXPos) {
        if("detecting" === state) {
            stoneObject.color = color
            stoneObject.trayId = trayId
            stoneObject.destinationXPos = destinationXPos
            console.log("--- color detected event received: color=" + color + ", trayId=" + trayId + ", destinationXPos=" + destinationXPos)
        }
    }

    function onDetectorEndReached() {
        if("detecting" === state) {
            state = "detected"
        }
    }

    // checks if a valid ejector id was set
    function needsEjection() {
        return trayId > 0
    }

    function updateConveyorAnimationTime() {
        conveyorAnimation.duration = conveyorSpeed / (lightbarrierAfterDetectorXPos - startPosX) * (destinationXPos - lightbarrierAfterDetectorXPos)
    }

    states: [
        State { name: "created" },   // created and placed on instrument
        State { name: "detecting" }, // moving under the color detecting unit
        State { name: "detected" },  // sensor after color detecting unit reached
        State { name: "moving" },    // moving to ejector or bin
        State { name: "moved" },     // reached position under ejector
        State { name: "ejecting" },  // ejecting to tray
        State { name: "reached" }    // reached target position
    ]

    transitions: [
        Transition {
            from: "created";
            to: "detecting";
            animations:     PropertyAnimation {
                id: detectionAnimation
                loops: 1
                alwaysRunToEnd: true
                target: stoneObject
                property: "x"
                from: startPosX
                to: lightbarrierAfterDetectorXPos
                easing.type: Easing.Linear
                duration: conveyorSpeed
                onRunningChanged: {
                    if(!running) {
                        state = "detected"
                    }
                }
            }
        },
        Transition {
            from: "detected";
            to: "moving";
            animations: NumberAnimation {
                id: conveyorAnimation
                loops: 1
                alwaysRunToEnd: true
                target: stoneObject
                property: "x"
                from: lightbarrierAfterDetectorXPos
                to: destinationXPos
                easing.type: Easing.Linear
                duration: conveyorSpeed
            }
            onRunningChanged: {
                if(!running)
                {
                    if(needsEjection())
                        state = "moved"
                    else
                        state = "reached"
                }
            }
        },
        Transition {
            from: "moving";
            to: "moved";
            onRunningChanged: {
                if( running === false)
                {
                    conveyorAnimation.complete()
                    stoneObject.x = conveyorAnimation.to
                }
            }
        },
        Transition {
            from: "moved";
            to: "ejecting";
            animations: NumberAnimation {
                id: ejectorChipAnimation
                target: stoneObject
                property: "y"
                from: stoneObject.startPosY
                to: stoneObject.stopPosY
                easing.type: Easing.Linear
                duration: 300
            }
            onRunningChanged: {
                if(!running && "ejecting" === state)
                {
                    state = "reached"
                }
            }
        },
        Transition {
            to: "reached"
            onRunningChanged: {
                if(!running) {
                    trayReached(trayId)
                }
            }
        }

    ]

    Rectangle {
        id: circle
        anchors.fill: parent
        radius: 90
        color: "red"
        border.color: "black"
        border.width: parent.width * 0.05

        MouseArea {
            anchors.fill: parent
            onClicked: {
                stoneObject.destroy();
            }
        }
    }
}
