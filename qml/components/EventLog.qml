import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3

import ".."

Rectangle {
    id: statisticRect
    color: "white"
    border.color: "transparent"

    RowLayout{
        id: titleLayout
        anchors{left:parent.left;right: parent.right; top: parent.top; }
        height: 40
        spacing: Style.bigMargin

        Text {
            id:startStopTitle
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.margins: Style.smallMargin
            text: qsTr("Log")
            color: Style.textColor
            font.pixelSize: Style.titleFontSize
        }

        Button {
            id: previousEventButton
            background: Rectangle{
                anchors.fill: parent
                color: "transparent"
            }

            contentItem: Image {
                source: "qrc:/arrow_up.png"
            }
        }

        Button {
            id: nextEventButton
            background: Rectangle{
                anchors.fill: parent
                color: "transparent"
            }

            contentItem: Image {
                source: "qrc:/arrow_down.png"
            }
        }
    } // RowLayout

    EventTableView {
        id: eventTableView

        anchors{left:parent.left;right: parent.right; bottom: parent.bottom; top: titleLayout.bottom}
        anchors.margins: Style.smallMargin

        Layout.fillHeight: true
        Layout.fillWidth: true
    }
}
