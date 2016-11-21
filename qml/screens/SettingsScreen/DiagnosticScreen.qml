import QtQuick 2.0
import QtQuick.Controls 2.0

import QtQuick.Layouts 1.3

import ".."
import "../.."
import "../../controls"
import "../../components"
import "../../items"


Rectangle {
    id: diagnosticScreen
    color: "#9aa6ac"

    GridLayout{
        id: mainGrid
        anchors.fill: parent
        anchors.margins: Style.bigMargin
        columns: 4
        rows: 6
        rowSpacing: Style.bigMargin
        columnSpacing: Style.bigMargin

        Simulator {
            id: simulator
            //conveyor.velocity: testControl.conveyorVelocityControl.value
            conveyor.running:                             websocketClient.motorRunning
            lightbarrierBeforeColorDetectionState:        websocketClient.lightbarrierOneState
            lightbarrierAfterColorDetectionState:         websocketClient.lightbarrierTwoState
            lightbarrierTrayOne.lightbarrierInterruted:   websocketClient.lightbarrierThreeState
            lightbarrierTrayTwo.lightbarrierInterruted:   websocketClient.lightbarrierFourState
            lightbarrierTrayThree.lightbarrierInterruted: websocketClient.lightbarrierFiveState
            detectedColor:                                websocketClient.detectedColor
            lightbarrierTrayOne.trayColor:                countingLogic.trayOneColor
            lightbarrierTrayTwo.trayColor:                countingLogic.trayTwoColor
            lightbarrierTrayThree.trayColor:              countingLogic.trayThreeColor

            Layout.row: 0
            Layout.rowSpan: 4
            Layout.column: 0
            Layout.columnSpan: 3
            Layout.fillHeight: true
            Layout.fillWidth : true
            Layout.preferredWidth: parent.width * 0.75
            Layout.preferredHeight: parent.height * 0.75
            Layout.alignment: Qt.AlignTop | Qt.AlignLeft
            Layout.margins: 0

            Component.onCompleted: {
                websocketClient.valveEjected.connect(simulator.valveEjected)
            }
        }

        StartStopControl {
            id: startStopControl

            Layout.row: 0
            Layout.rowSpan: 1
            Layout.column: 3
            Layout.columnSpan: 1
            //Layout.fillHeight: true
            //Layout.fillWidth : true
            Layout.preferredWidth: parent.width/4
            Layout.preferredHeight:simulator.height/5
            Layout.alignment: Qt.AlignTop | Qt.AlignLeft
            Layout.margins: 0
            active: websocketClient.motorRunning

            onButtonToggled: {
                websocketClient.sendMotorRunningRequest(state)
            }
        }

//        Legend {
//            id: legendRect

//            Layout.row: 1
//            Layout.rowSpan: 5
//            Layout.column: 0
//            Layout.columnSpan: 2
//            Layout.fillHeight: true
//            Layout.fillWidth : true
//            Layout.preferredWidth: parent.width/2
//            Layout.preferredHeight:parent.height/3
//            Layout.alignment: Qt.AlignTop | Qt.AlignLeft
//            Layout.margins: 0
//        }

        TestControl {
            id: testControl
            Layout.row: 1
            Layout.rowSpan: 5
            Layout.column: 3
            Layout.columnSpan: 1
            Layout.fillHeight: true
            Layout.fillWidth : true
            Layout.preferredWidth: parent.width/4
            Layout.preferredHeight:parent.height*4/5
            Layout.alignment: Qt.AlignTop | Qt.AlignLeft
            Layout.margins: 0
        }

        Statistic {
            id: statisticRect

            Layout.row: 4
            Layout.rowSpan: 2
            Layout.column: 2
            Layout.columnSpan: 1
            Layout.fillHeight: true
            Layout.fillWidth : true
            Layout.preferredWidth: parent.width/4
            Layout.preferredHeight:parent.height/3
            Layout.alignment: Qt.AlignTop | Qt.AlignLeft
            Layout.margins: 0
        }
    } // GridLayout
}
