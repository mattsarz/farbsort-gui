import QtQuick 2.0
import QtQuick.Controls 2.0

import "../../"

Rectangle {
    id: mainTitleBar
    color: "white"
    anchors.left: parent.left
    anchors.right: parent.right

    signal settingsButtonClicked
    signal diagnosticsButtonClicked


    Image {
        id: bbvLogo
        fillMode: Image.PreserveAspectFit
        source:"qrc:/bbvlogo.png"
        height: parent.height*0.6
        smooth: true
        anchors.verticalCenter: parent.verticalCenter
        anchors.left:parent.left
        anchors.leftMargin: Style.medMargin
    }

    Text {
        id: titleText
        text: qsTr("Swiss Top Sort")
        color: "red"
        font.pixelSize: Style.mainTitleFontSize
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: bbvLogo.right
        anchors.leftMargin: 30
    }

    Button {
        id: settingsButton
        width: parent.height
        height: parent.height
        anchors.right: parent.right
        anchors.rightMargin: 0

        background: Rectangle{
            color: "transparent"
        }

        Image {
            source: "qrc:/settings.png"
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.margins: Style.bigMargin
            fillMode: Image.PreserveAspectFit
        }

        onPressed: scale  = 0.8
        onReleased: scale = 1.0

        onClicked: {
            settingsButtonClicked();
        }
    }
}
