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
    radius: 2
    color: active ? activeColor : inactiveColor
    border.width: 1

    RowLayout {
        anchors.fill: parent
        spacing: 8
        anchors.margins: 5

        Image {
            id: icon;
            smooth: true
            fillMode: Image.PreserveAspectFit
            source: root.active ?  "qrc:/stop.png" : "qrc:/start.png"
            Layout.preferredHeight: parent.height *0.8
            Layout.preferredWidth: parent.widtht/4
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignCenter
        }

        Text {
            id: text
            color: "white"
//            anchors.centerIn: parent
            font.pixelSize: 14
            Layout.fillHeight: true
            Layout.preferredHeight: parent.height *0.8
            Layout.preferredWidth: parent.widtht*3/4
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
            text: root.active ?  "STOP" : "START"
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: { active = !active; root.toggled() }
    }
}
