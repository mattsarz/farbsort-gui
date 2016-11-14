import QtQuick 2.0
import QtQuick.Layouts 1.3


Rectangle {
    id: root
    property color activeColor: "green"
    property color inactiveColor: "darkgreen"
    property alias textColor: text.color
    property bool active: false
    signal toggled

    width: 149
    height: 30
    radius: 3
    color: active ? activeColor : inactiveColor
    border.width: 1

    RowLayout {
        anchors.fill: parent
        anchors.margins: 8

        Image {
            id: icon;
            fillMode: Image.PreserveAspectFit
            source: root.active ?  "qrc:/stop.png" : "qrc:/start.png"
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignCenter
        }

        Text {
            id: text
            color: "white"
            anchors.centerIn: parent
            font.pixelSize: 14
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignCenter
            text: root.active ?  "STOP" : "START"
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: { active = !active; root.toggled() }
    }
}
