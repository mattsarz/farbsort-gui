import QtQuick 2.0
import QtQuick.Layouts 1.3

import ".."

Rectangle {
    id: legendRect
    color: "white"
    height:200
    width: 400

    Text {
        id:startStopTitle
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.margins: Style.smallMargin
        text: qsTr("Legende")
        font.pixelSize: Style.titleFontSize
    }

    GridLayout{
        id: legendGrid
        anchors.top: startStopTitle.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: Style.bigMargin
        columns: 2
        rows: 5
        rowSpacing: Style.medMargin
        columnSpacing: Style.bigMargin

        Text {
            id: ejectorText1
            Layout.row: 0
            Layout.rowSpan: 1
            Layout.column: 0
            Layout.columnSpan: 1
            Layout.fillHeight: true
            Layout.fillWidth : true
            Layout.preferredWidth: parent.width/2
            Layout.preferredHeight:parent.height/7
            Layout.alignment:  Qt.AlignLeft
            Layout.margins: 0
            text: "A1   " + qsTr("Ausstosser")
        }

        Text {
            id: ejectorText2
            Layout.row: 1
            Layout.rowSpan: 1
            Layout.column: 0
            Layout.columnSpan: 1
            Layout.fillHeight: true
            Layout.fillWidth : true
            Layout.preferredWidth: parent.width/2
            Layout.preferredHeight:parent.height/7
            Layout.alignment: Qt.AlignLeft
            Layout.margins: 0
            text: "A2   " + qsTr("Ausstosser")
        }

        Text {
            id: ejectorText3
            Layout.row: 2
            Layout.rowSpan: 1
            Layout.column: 0
            Layout.columnSpan: 1
            Layout.fillHeight: true
            Layout.fillWidth : true
            Layout.preferredWidth: parent.width/2
            Layout.preferredHeight:parent.height/7
            Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
            Layout.margins: 0
            text: "A3   " + qsTr("Ausstosser")
        }

        Text {
            id: lightBarrierText1
            Layout.row: 0
            Layout.rowSpan: 1
            Layout.column: 1
            Layout.columnSpan: 1
            Layout.fillHeight: true
            Layout.fillWidth : true
            Layout.preferredWidth: parent.width/2
            Layout.preferredHeight:parent.height/7
            Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
            Layout.margins: 0
            text: "S1   " + qsTr("Lichtschranke")
        }

        Text {
            id: lightBarrierText2
            Layout.row: 1
            Layout.rowSpan: 1
            Layout.column: 1
            Layout.columnSpan: 1
            Layout.fillHeight: true
            Layout.fillWidth : true
            Layout.preferredWidth: parent.width/2
            Layout.preferredHeight:parent.height/7
            Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
            Layout.margins: 0
            text: "S2   " + qsTr("Lichtschranke")
        }

        Text {
            id: lightBarrierText3
            Layout.row: 2
            Layout.rowSpan: 1
            Layout.column: 1
            Layout.columnSpan: 1
            Layout.fillHeight: true
            Layout.fillWidth : true
            Layout.preferredWidth: parent.width/2
            Layout.preferredHeight:parent.height/7
            Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
            Layout.margins: 0
            text: "S3   " + qsTr("Lichtschranke")
        }

        Text {
            id: lightBarrierText4
            Layout.row: 3
            Layout.rowSpan: 1
            Layout.column: 1
            Layout.columnSpan: 1
            Layout.fillHeight: true
            Layout.fillWidth : true
            Layout.preferredWidth: parent.width/2
            Layout.preferredHeight:parent.height/7
            Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
            Layout.margins: 0
            text: "S4   " + qsTr("Lichtschranke")
        }

        Text {
            id: lightBarrierText5
            Layout.row: 4
            Layout.rowSpan: 1
            Layout.column: 1
            Layout.columnSpan: 1
            Layout.fillHeight: true
            Layout.fillWidth : true
            Layout.preferredWidth: parent.width/2
            Layout.preferredHeight:parent.height/7
            Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
            Layout.margins: 0
            text: "S5   " + qsTr("Lichtschranke")
        }
    } // GridLayout
}
