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
    property int ejector1CenterXPos: 500
    property int ejector2CenterXPos: 600
    property int ejector3CenterXPos: 700
    property int trashBinCenterXPos: 950
    property color trayOneColor: "blue"
    property color trayTwoColor: "red"
    property color trayThreeColor: "white"
    property color recognizedColor: "transparent"

    function startDetection() {
        stoneObject.x = stoneObject.startPosX
        stoneObject.y = stoneObject.startPosY
        stoneObject.color = "transparent"
        stoneObject.state = "detecting"
    }

    function startEjecting() {
        if("moving" === stoneObject.state) {
            stoneObject.state = "moved"
        }
        if("moved" === stoneObject.state && colorRecognized()) {
            stoneObject.state = "ejecting"
        }
    }

    function moveConveyor() {
        if("detecting" === stoneObject.state) {
            stoneObject.state = "detected"
        }
        if("detected" === stoneObject.state) {
            stoneObject.state = "moving"
        }
    }

    function onColorDetected() {
        if("detecting" === stoneObject.state || "detected" === stoneObject.state) {
            stoneObject.color = stoneObject.recognizedColor
        }
    }

    Component.onCompleted: {
        websocketClient.detectedColorChanged.connect(onColorDetected)
        websocketClient.valveEjected.connect(startEjecting)
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
            }
            onRunningChanged: {
                if( running === false)
                {
                    stoneObject.state = "detected"
                }
            }
        },
        Transition {
            from: "detecting";
            to: "detected";
            onRunningChanged: {
                if( running === false)
                {
                    detectionAnimation.complete()
                    stoneObject.x = detectionAnimation.to
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
                to: trayXPosition()
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
    }

    // checks if the color is not set to transparent
    function colorRecognized() {
        return (Qt.colorEqual(color, "blue") || Qt.colorEqual(color, "red") || Qt.colorEqual(color, "white"))
    }

    function trayXPosition() {
        if(stoneObject.colorRecognized()) {
            console.log("color recognized")
            if(stoneObject.color === trayOneColor) {
                return ejector1CenterXPos
            } else if(stoneObject.color === trayTwoColor) {
                return ejector2CenterXPos
            } else {
                return ejector3CenterXPos
            }
        } else {
            console.log("color not recognized")
            return trashBinCenterXPos
        }
    }

    function conveyorAnimationTime() {
        return conveyorSpeed / (detectionAnimation.to - detectionAnimation.from) * (conveyorAnimation.to - conveyorAnimation.from)
    }
}
