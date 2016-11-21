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

        onClicked: { stoneObject.x = 0; stoneObject.y=stoneObject.startPosY; stoneObject.color="transparent"; conveyorAnimation.stop(); ejectorChipAnimation.stop(); detectionAnimation.restart() }
    }

    PropertyAnimation {
        id: detectionAnimation
        loops: 1
        alwaysRunToEnd: true
        target: stoneObject; property: "x";
        to: toColorDetectionXPos
        easing.type: Easing.Linear; duration: conveyorSpeed

        onStopped: {
            if(stoneObject.x === toColorDetectionXPos){
                stoneObject.colorId = Math.floor((Math.random() * 4) + 1)

                switch(stoneObject.colorId){
                case 1: // red
                    stoneObject.color = "red"
                    conveyorAnimation.to = ejector1CenterXPos
                    break;
                case 2: // blue
                    stoneObject.color = "blue"
                    conveyorAnimation.to = ejector2CenterXPos
                    break;
                case 3: // white
                    stoneObject.color = "white"
                    conveyorAnimation.to = ejector3CenterXPos
                    break;
                 default:
                     conveyorAnimation.to = trashBinCenterXPos
                     break;
                }
            }
            conveyorAnimation.duration = detectionAnimation.duration*(conveyorAnimation.to-stoneObject.x)/(detectionAnimation.to-stoneObject.startPosX)
            conveyorAnimation.start()
        } // onStopped
    } // detectionAnimation

    NumberAnimation {
        id: conveyorAnimation
        target: stoneObject; property: "x";
        easing.type: Easing.Linear; duration: conveyorSpeed

        onStopped: {
            if(stoneObject.colorId !== 4){
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
