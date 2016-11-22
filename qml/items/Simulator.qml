import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQml 2.0

import ".."
import "../components"

Rectangle {
    id: simulator
    color: "white"

    property alias conveyor: conveyor
    property alias ejectorOne: ejectorOne
    property alias ejectorTwo: ejectorTwo
    property alias ejectorThree: ejectorThree
    property bool  lightbarrierBeforeColorDetectionState: false
    property bool  lightbarrierAfterColorDetectionState: false
    property alias lightbarrierTrayOne: lightbarrierTrayOne
    property alias lightbarrierTrayTwo: lightbarrierTrayTwo
    property alias lightbarrierTrayThree: lightbarrierTrayThree
    property alias detectedColor: colorRecongnition.color
    signal valveEjected(int number)

// The Conveyor has to be outside of the grid layout because of gridlayout warning "cell already taken"

    Conveyor {
        id: conveyor
            height: parent.height/7
            anchors.left: parent.left
            anchors.leftMargin: Style.bigMargin
            anchors.right: unidentifiedObjectBin.left
            anchors.rightMargin: Style.bigMargin
            anchors.verticalCenter:   parent.verticalCenter
    }

    Rectangle {
        id: unidentifiedObjectBin
        height: parent.height/7
        width:  parent.height/7
        radius: 4
        border.color: "gray"
        border.width: 1
        anchors.right: parent.right
        anchors.rightMargin: Style.bigMargin
        anchors.verticalCenter: parent.verticalCenter
    }


    GridLayout {
        id: layoutGrid
        anchors.fill: parent
        anchors.margins: Style.bigMargin
        rows: 7
        columns: 9
        rowSpacing: 0
//        columnSpacing: Style.bigMargin


        Item {
            id:spacer1
//            color: "transparent"
//            border.color: "gray"

            Layout.row: 0
            Layout.rowSpan: 2
            Layout.column: 0
            Layout.columnSpan: 5
            Layout.preferredWidth:parent.width*2/9
            Layout.preferredHeight: parent.height*2/7
            Layout.alignment: Qt.AlignLeft
            Layout.margins: 0
        }

        LightBarrier {
            id: bevorColorRecognition
            active:  lightbarrierBeforeColorDetectionState
            stoneColor: "transparent"

            Layout.row: 2
            Layout.rowSpan: 3
            Layout.column: 0
            Layout.columnSpan: 1
            Layout.preferredWidth:parent.width/20
            Layout.preferredHeight: parent.height/3
            Layout.alignment: Qt.AlignHCenter
            Layout.margins: 0

        }

        Item {
            id:spacer2
//            color: "transparent"
//            border.color: "gray"

            Layout.row: 5
            Layout.rowSpan: 2
            Layout.column: 0
            Layout.columnSpan: 2
            Layout.preferredWidth:parent.width*2/9
            Layout.preferredHeight: parent.height*2/7
            Layout.alignment: Qt.AlignLeft
            Layout.margins: 0
        }

        ColorRecognitionUnit {
            id: colorRecongnition
            color: "red"

            Layout.row: 2
            Layout.rowSpan: 3
            Layout.column: 1
            Layout.columnSpan: 2
            Layout.preferredWidth: parent.width*2/9
            Layout.preferredHeight: parent.height/3
            Layout.alignment: Qt.AlignLeft | Qt.AlignHCenter
            Layout.margins: 0
        }

        LightBarrier {
            id: afterColorRecognition
            active: lightbarrierAfterColorDetectionState
            stoneColor: detectedColor

            Layout.row: 2
            Layout.rowSpan: 3
            Layout.column: 3
            Layout.columnSpan: 1
            Layout.preferredWidth: parent.width/20
            Layout.preferredHeight: parent.height/3
            Layout.alignment: Qt.AlignLeft | Qt.AlignHCenter
            Layout.margins: 0
        }

        Item {
            id:spacer3
            opacity: 0.5
//            color: "olive"
//            border.color: "gray"

            Layout.row: 3
            Layout.rowSpan: 1
            Layout.column: 5
            Layout.columnSpan: 4
            Layout.fillWidth : true
            Layout.preferredWidth:parent.width*4/9
            Layout.preferredHeight: parent.height/7
            Layout.alignment: Qt.AlignCenter
            Layout.margins: 0
        }

        Ejector {
            id: ejectorOne

            Layout.row: 0
            Layout.rowSpan: 3
            Layout.column: 5
            Layout.columnSpan: 1
            Layout.preferredWidth: 40
            Layout.preferredHeight: parent.height*3/8
            Layout.alignment: Qt.AlignBottom| Qt.AlignRight
            Layout.margins: 0
            ejectDistance: conveyor.height
        }

        Ejector {
            id: ejectorTwo

            Layout.row: 0
            Layout.rowSpan: 3
            Layout.column: 6
            Layout.columnSpan: 1
            Layout.preferredWidth: 40
            Layout.preferredHeight: parent.height*3/8
            Layout.alignment: Qt.AlignBottom| Qt.AlignHCenter
            Layout.margins: 0
            ejectDistance: conveyor.height
        }

        Ejector {
            id: ejectorThree

            Layout.row: 0
            Layout.rowSpan: 3
            Layout.column: 7
            Layout.columnSpan: 1
            Layout.preferredWidth: 40
            Layout.preferredHeight: parent.height*3/8
            Layout.alignment: Qt.AlignBottom| Qt.AlignLeft
            Layout.margins: 0
            ejectDistance: conveyor.height
        }

        Tray {
            id: lightbarrierTrayOne
            trayColor: "white"
            lightbarrierInterruted: false

            Layout.row: 4
            Layout.rowSpan: 2
            Layout.column: 5
            Layout.columnSpan: 1
//            Layout.fillHeight: true
//            Layout.fillWidth : true
            Layout.preferredWidth: 40
            Layout.preferredHeight: parent.height / 3
            Layout.alignment: Qt.AlignTop | Qt.AlignRight
            Layout.margins: 0
        }

        Item {
            id: spacer4

            Layout.row: 6
            Layout.rowSpan: 1
            Layout.column: 5
            Layout.columnSpan: 1
            Layout.preferredWidth: parent.width / 15
            Layout.preferredHeight: 0
            Layout.alignment: Qt.AlignBottom | Qt.AlignRight
            Layout.margins: 0
        }

        Tray {
            id: lightbarrierTrayTwo
            width: 40
            trayColor: "red"
            lightbarrierInterruted: false
            Layout.row: 4
            Layout.rowSpan: 2
            Layout.column: 6
            Layout.columnSpan: 1
            Layout.preferredWidth: 40
            Layout.preferredHeight: parent.height / 3
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
            Layout.margins: 0
        }

        Item {
            id: spacer5

            Layout.row: 6
            Layout.rowSpan: 1
            Layout.column: 6
            Layout.columnSpan: 1
            Layout.fillWidth : true
            Layout.preferredWidth: parent.width / 15
            Layout.preferredHeight: 0
            Layout.alignment: Qt.AlignBottom | Qt.AlignHCenter
            Layout.margins: 0
        }

        Tray {
            id: lightbarrierTrayThree
            trayColor: "blue"
            lightbarrierInterruted: false
            Layout.row: 4
            Layout.rowSpan: 2
            Layout.column: 7
            Layout.columnSpan: 1
            Layout.preferredWidth: 40
            Layout.preferredHeight: parent.height / 3
            Layout.alignment: Qt.AlignTop | Qt.AlignLeft
            Layout.margins: 0
        }

        Stone {
            height: 40
            width: 40
            startPosY: parent.height/2 - height / 2
            stopPosY: lightbarrierTrayOne.y + lightbarrierTrayOne.trayRectVerticalMiddle - height / 2
            conveyorSpeed: 800
            toColorDetectionXPos: colorRecongnition.x + colorRecongnition.width / 2
            ejector1CenterXPos: lightbarrierTrayOne.x + lightbarrierTrayOne.width / 2 - width / 2
            ejector2CenterXPos: lightbarrierTrayTwo.x + lightbarrierTrayTwo.width / 2 - width / 2
            ejector3CenterXPos: lightbarrierTrayThree.x + lightbarrierTrayThree.width / 2 - width / 2
            trashBinCenterXPos: unidentifiedObjectBin.x + unidentifiedObjectBin.width / 2 - width / 2
            trayOneColor: lightbarrierTrayOne.trayColor
            trayTwoColor: lightbarrierTrayTwo.trayColor
            trayThreeColor: lightbarrierTrayThree.trayColor
            recognizedColor: colorRecongnition.color
        }
    } // GridLayout

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

    onLightbarrierBeforeColorDetectionStateChanged: {

    }
}
