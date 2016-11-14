import QtQuick 2.0

Rectangle {
    id: diagnosticScreen
    color: "#9aa6ac"

    signal exitClicked

    MouseArea {
        anchors.fill: parent
        onClicked: exitClicked()
    }
}
