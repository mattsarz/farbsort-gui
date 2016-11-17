import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4

import ".."

Rectangle {
    id: stateControl
    color: "white"
    property bool running: false

    Text {
        id:startStopTitle
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.margins: Style.smallMargin
        text: qsTr("Status")
        font.pixelSize: Style.titleFontSize
    }

    CircularGauge {
        id: statusGauge
        anchors{ left: parent.left; right: parent.right;  top: startStopTitle.bottom }
        anchors.margins: Style.bigMargin
        value: stateControl.running ? maximumValue : 0

        style: CircularGaugeStyle {
            needle: Rectangle {
                y: outerRadius * 0.15
                implicitWidth: outerRadius * 0.03
                implicitHeight: outerRadius * 0.9
                antialiasing: true
                color: Qt.rgba(0.66, 0.3, 0, 1)
            }

            tickmarkLabel:  Text {
                font.pixelSize: 0
            }

            minorTickmark: Rectangle {
                  visible: false
                  implicitWidth: outerRadius * 0.01
                  antialiasing: true
                  implicitHeight: outerRadius * 0.03
                  color: "#e5e5e5"
              }
        }

        Behavior on value {
            NumberAnimation {
                duration: 500
            }
        }
    }
}
