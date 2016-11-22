import QtQuick 2.0

Item {
    id: stoneObject
    property alias color: circle.color
    property int startPosX: 16

    property int startPosY: parent.height/2 - stoneObject.height/2
    property int stopPosY: startPosY + 100
    property int colorId: 4
    property int conveyorSpeed: 800
    property int toColorDetectionXPos: 300
    property int ejector1CenterXPos: 500
    property int ejector2CenterXPos: 600
    property int ejector3CenterXPos: 700
    property int trashBinCenterXPos: 950
    property color trayOneColor: "blue"
    property color trayTwoColor: "red"
    property color trayThreeColor: "white"
    property color recognizedColor: "transparent"

    signal startEjectorAnimation(int chipColorId);

    Rectangle {
        id: circle
        anchors.fill: parent
        radius: 90
        color: "red"
        border.color: "black"
        border.width: parent.width * 0.05
    }

    MouseArea {
        id:mouseArea
        anchors.fill: parent

        onClicked: {
            stoneObject.x = 0
            stoneObject.y = stoneObject.startPosY
            stoneObject.color = "transparent"
            conveyorAnimation.stop()
            ejectorChipAnimation.stop()
            detectionAnimation.restart()
        }
    }

    // checks if the color is not set to transparent
    function colorRecognized() {
        return (Qt.colorEqual(color, "blue") || Qt.colorEqual(color, "red") || Qt.colorEqual(color, "white"))
    }


    PropertyAnimation {
        id: detectionAnimation
        loops: 1
        alwaysRunToEnd: true
        target: stoneObject; property: "x";
        to: toColorDetectionXPos
        easing.type: Easing.Linear
        duration: conveyorSpeed

        onStopped: {
            if(stoneObject.x === toColorDetectionXPos) {
                stoneObject.color = recognizedColor
                // TODO: sync animation with colorDetection event
                if(stoneObject.colorRecognized()) {
                    console.log("color recognized")
                    if(stoneObject.color === trayOneColor) {
                        conveyorAnimation.to = ejector1CenterXPos
                    } else if(stoneObject.color === trayTwoColor) {
                        conveyorAnimation.to = ejector2CenterXPos
                    } else {
                        conveyorAnimation.to = ejector3CenterXPos
                    }
                } else {
                    console.log("color not recognized")
                    conveyorAnimation.to = trashBinCenterXPos
                }
            }
            conveyorAnimation.duration = detectionAnimation.duration*(conveyorAnimation.to - stoneObject.x) / (detectionAnimation.to - stoneObject.startPosX)
            conveyorAnimation.start()
        }
    } // detectionAnimation

    NumberAnimation {
        id: conveyorAnimation
        target: stoneObject; property: "x";
        easing.type: Easing.Linear; duration: conveyorSpeed

        onStopped: {
            if(stoneObject.colorRecognized()) {
               ejectorChipAnimation.start()
            }
        }
    }

   NumberAnimation {
       id: ejectorChipAnimation
       target: stoneObject; property: "y"
       from: stoneObject.startPosY; to: stoneObject.stopPosY
       easing.type: Easing.Linear; duration: 300

       onStopped: stoneObject.colorId = 4
   }
}
