import QtQuick 2.0
import QtQuick.Controls 2.0

Rectangle {
    id: mainTitleBar
    color: "white"
    anchors.left: parent.left
    anchors.right: parent.right

    signal diagButtonClicked


    Image {
        id: bbvLogo
        fillMode: Image.PreserveAspectFit
        source:"qrc:/bbvlogo.png"
        height: parent.height*0.6
        smooth: true
        anchors.verticalCenter: parent.verticalCenter
        anchors.left:parent.left
        anchors.leftMargin: 12
    }

    Text {
        id: titleText
        text: qsTr("Swiss Top Sort")
        color: "red"
        font.pixelSize: 26
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: bbvLogo.right
        anchors.leftMargin: 30
    }

    Button {
        id: diagnosticButton
        width: parent.height
        height: parent.height
        anchors.right: parent.right
        anchors.rightMargin: 8

        background: Rectangle{
            color: "transparent"
        }

        Image {
            id: name
            source: "qrc:/settings.png"
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }

        onPressed: scale  = 0.8
        onReleased: scale = 1.0

        onClicked: {
            diagButtonClicked();
        }
    }
}
