import QtQuick 2.0

Rectangle {
    id: settingsScreen
    color: "darkgreen"

    signal exitClicked

    MouseArea {
        anchors.fill: parent
        onClicked: exitClicked()
    }
}
