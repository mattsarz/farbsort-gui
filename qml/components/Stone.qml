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
//    property int ejector1CenterXPos: 500
//    property int ejector2CenterXPos: 600
//    property int ejector3CenterXPos: 700
//    property int trashBinCenterXPos: 950
//    property color trayOneColor: "blue"
//    property color trayTwoColor: "red"
//    property color trayThreeColor: "white"
//    property color recognizedColor: "transparent"

    function startDetection() {
        stoneObject.x = stoneObject.startPosX
        stoneObject.y = stoneObject.startPosY
        stoneObject.color = "transparent"
        state = "detecting"
    }

    function startEjecting() {
        if("moving" === state) {
            state = "moved"
        }
        if("moved" === state && colorRecognized()) {
            state = "ejecting"
        }
    }

    function moveConveyor() {
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

    Component.onCompleted: {
        websocketClient.valve1StateChanged.connect(startEjecting)
        websocketClient.valve3StateChanged.connect(startEjecting)
        websocketClient.valve2StateChanged.connect(startEjecting)
        websocketClient.lightbarrierTwoStateChanged.connect(moveConveyor)
    }

    states: [
        State { name: "created" },
        State { name: "detecting" },
        State { name: "detected" },
        State { name: "moving" },
        State { name: "moved" },
        State { name: "ejecting" },
        State { name: "reached" }
    ]

    onStateChanged: {
        console.log("state: " + state)
    }

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
                duration: conveyorSpeed //conveyorAnimationTime()
            }
            onRunningChanged: {
                if( running === false)
                {
                    if(colorRecognized())
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
                if( running === false)
                {
                    state = "reached"
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

    // checks if the color is not set to transparent
    function colorRecognized() {
        return (Qt.colorEqual(color, "blue") || Qt.colorEqual(color, "red") || Qt.colorEqual(color, "white"))
    }

    function conveyorAnimationTime() {
        return conveyorSpeed / (detectionAnimation.to - detectionAnimation.from) * (conveyorAnimation.to - conveyorAnimation.from)
    }
}
