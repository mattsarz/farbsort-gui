import QtQuick 2.0
import QtQuick.Controls 2.0

import QtQuick.Layouts 1.3

import "../.."

Item {
    id: configurationScreen

    GridLayout{
        id: diagGrid
        anchors.fill: parent
        anchors.margins: Style.bigMargin
        anchors.topMargin: 0
        columns: 3
        rows: 4
        rowSpacing: Style.bigMargin
        columnSpacing: Style.bigMargin

        Rectangle{
            id: one
            color: "white"
            Text {
                id:oneText
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.margins: Style.smallMargin
                text: qsTr("One")
                color: Style.textColor
                font.pixelSize: Style.titleFontSize
            }

            Layout.row: 0
            Layout.rowSpan: 2
            Layout.column: 0
            Layout.columnSpan: 3
            Layout.preferredHeight: parent.height*2/3
            Layout.preferredWidth: parent.width*3/4
        }

        Rectangle{
            id: two
            color: "white"
            Text {
                id:twoText
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.margins: Style.smallMargin
                text: qsTr("Two")
                color: Style.textColor
                font.pixelSize: Style.titleFontSize
            }

            Layout.row: 2
            Layout.rowSpan: 1
            Layout.column: 0
            Layout.columnSpan: 2
            Layout.preferredHeight: parent.height/3 - Style.bigMargin
            Layout.preferredWidth: parent.width/2
        }

        Rectangle{
            id: three
            color: "white"
            Text {
                id:threeText
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.margins: Style.smallMargin
                text: qsTr("Three")
                color: Style.textColor
                font.pixelSize: Style.titleFontSize
            }

            Layout.row: 0
            Layout.rowSpan:1
            Layout.column: 3
            Layout.columnSpan: 1
            Layout.preferredHeight: parent.height/3 -16
            Layout.preferredWidth: parent.width/4 - Style.bigMargin
        }

        Rectangle{
            id: four
            color: "white"
            Text {
                id:fourText
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.margins: Style.smallMargin
                text: qsTr("Four")
                color: Style.textColor
                font.pixelSize: Style.titleFontSize
            }

            Layout.row: 1
            Layout.rowSpan:1
            Layout.column: 3
            Layout.columnSpan: 1
            Layout.preferredHeight: parent.height/3
            Layout.preferredWidth: parent.width/4 - Style.bigMargin
        }

        Rectangle{
            id: five
            color: "white"
            Text {
                id:fiveText
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.margins: Style.smallMargin
                text: qsTr("Five")
                color: Style.textColor
                font.pixelSize: Style.titleFontSize
            }

            Layout.row: 2
            Layout.rowSpan:1
            Layout.column: 2
            Layout.columnSpan: 1
            Layout.preferredHeight: parent.height/3 - Style.bigMargin
            Layout.preferredWidth: parent.width/4 - Style.bigMargin
        }

        Rectangle{
            id: six
            color: "white"
            Text {
                id:sixText
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.margins: Style.smallMargin
                text: qsTr("Six")
                color: Style.textColor
                font.pixelSize: Style.titleFontSize
            }

            Layout.row: 2
            Layout.rowSpan:1
            Layout.column: 3
            Layout.columnSpan: 1
            Layout.preferredHeight: parent.height/3 - Style.bigMargin
            Layout.preferredWidth: parent.width/4 - Style.bigMargin
        }
    }
}
