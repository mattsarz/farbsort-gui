import QtQuick 2.5
import QtQuick.Controls 1.2
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.3

import "MainScreen"
import ".."
import "../controls"
import "../components"
import "../items"


Rectangle {
    id: mainScreen
    color: "#EEEEEE"
//    enabled: websocketClient.connected // TODO: This disables all mouse events. Please fix it

    signal settingsBtnClicked

    MainTitleBar {
        id:mainTitle
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: parent.height/13

        onSettingsButtonClicked: {
            settingsBtnClicked()
        }
    }

    GridLayout{
        id: mainGrid
        anchors.top: mainTitle.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
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

            // todo: scale animation drawing depending on screen size
            // transform: Scale { xScale: 1.2; yScale: 1.2}
        }

//        Rectangle{
//            id: simulator
//            color: "red"
//            Layout.row: 0
//            Layout.rowSpan: 4
//            Layout.column: 0
//            Layout.columnSpan: 3
//            Layout.fillHeight: true
//            Layout.fillWidth : true
//            Layout.preferredWidth: parent.width * 0.75
//            Layout.preferredHeight: parent.height * 0.75
//            Layout.alignment: Qt.AlignTop | Qt.AlignLeft
//            Layout.margins: 0
//        }

        StartStopControl {
            id: startStopControl

            Layout.row: 0
            Layout.rowSpan: 1
            Layout.column: 3
            Layout.columnSpan: 1
            Layout.fillHeight: true
            Layout.fillWidth : true
            Layout.preferredWidth: parent.width/4
            Layout.preferredHeight:simulator.height/5
            Layout.alignment: Qt.AlignTop | Qt.AlignLeft
            Layout.margins: 0
            active: websocketClient.motorRunning

            onButtonToggled: {
                websocketClient.sendMotorRunningRequest(startStopControl.active)
                websocketClient.sendCompressorRunningRequest(startStopControl.active)
            }
        }

        Status {
            id: stateControl

            Layout.row: 1
            Layout.rowSpan: 3
            Layout.column: 3
            Layout.columnSpan: 1
            Layout.fillHeight: true
            Layout.fillWidth : true
            Layout.preferredWidth: parent.width/4
            Layout.preferredHeight:simulator.height*4/5
            Layout.alignment: Qt.AlignTop | Qt.AlignLeft
            Layout.margins: 0
        }

        Legend {
            id: legendRect

            Layout.row: 4
            Layout.rowSpan: 2
            Layout.column: 0
            Layout.columnSpan: 2
            Layout.fillHeight: true
            Layout.fillWidth : true
            Layout.preferredWidth: parent.width/2
            Layout.preferredHeight:parent.height/3
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

        EmergencyButton {
            id: emergencyButton
            Layout.row: 4
            Layout.rowSpan: 2
            Layout.column: 3
            Layout.columnSpan: 1
            Layout.fillHeight: true
            Layout.fillWidth : true
            Layout.preferredWidth: parent.width/4
            Layout.preferredHeight:parent.height/3
            Layout.alignment: Qt.AlignTop | Qt.AlignLeft
            Layout.margins: 0
        }

        // ================================================================================
        // For test only
        // ================================================================================
//        TestControl {
//            id: testControl
//            color: "white"
//            Layout.row: 1
//            Layout.rowSpan: 3
//            Layout.column: 3
//            Layout.columnSpan: 1
//            Layout.fillHeight: true
//            Layout.fillWidth : true
//            Layout.preferredWidth: parent.width/4
//            Layout.preferredHeight:simulator.height*5/6
//            Layout.alignment: Qt.AlignTop | Qt.AlignLeft
//            Layout.margins: 0
//        }
    } // GridLayout
}
