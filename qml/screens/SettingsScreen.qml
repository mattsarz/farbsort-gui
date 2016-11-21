import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 2.0

import ".."
import "SettingsScreen"

Rectangle {
    id: settingsScreen
    color: "#9aa6ac"

    signal exitClicked

    MouseArea {
        anchors.fill: parent
        onClicked: exitClicked()
    }

    SettingsScreenTitle{
        id:settingsTitle
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: parent.height/13

        onExitClicked:{
//            stackView.clear()
            exitClicked()
        }
    }

    StackView {
        id: settingsStackView
        initialItem: diagnosticScreen
        anchors.top: settingsTitle.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 0

        pushEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to:1
                duration: 300
            }
        }
        pushExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to:0
                duration: 300
            }
        }
        popEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to:1
                duration: 300
            }
        }
        popExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to:0
                duration: 300
            }
        }
    }

    DiagnosticScreen {
        id: diagnosticScreen
        visible: true
    }

    ConfigurationScreen {
        id: configurationScreen
        visible: false
    }

}
