import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtQuick.Extras.Private 1.0

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
        color: Style.textColor
        font.pixelSize: Style.titleFontSize
    }

    CircularGauge {
        id: statusGauge
        anchors.top: startStopTitle.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: Style.bigMargin
        height: parent.width*3/4
        width: height
        value: stateControl.running ? maximumValue : 0


        style: CircularGaugeStyle {
            id: style
            minimumValueAngle: -120.0
            maximumValueAngle: 120.0

            needle: Rectangle {
                y: outerRadius * 0.15
                implicitWidth: outerRadius * 0.03
                implicitHeight: outerRadius * 0.9
                antialiasing: true
                color: "#b5bdc0"
            }

            tickmarkLabel:  Text {
                font.pixelSize: 0
            }

            minorTickmark: Rectangle {
                  visible: false
                  implicitWidth: outerRadius * 0.01
                  antialiasing: true
                  implicitHeight: outerRadius * 0.03
                  color: "darkgray"//"#b5bdc0"
              }

            foreground: Item {
                Rectangle {
                    width: outerRadius * 0.2
                    height: width
                    radius: width / 2
                    color: "#b5bdc0"
                    anchors.centerIn: parent
                }
            }
        }

        Behavior on value {
            NumberAnimation {
                duration: 500
            }
        }
    }
}
