import QtQuick 2.5
import QtQuick.Controls 2.0

Rectangle {
    property alias startButton: startButton
    property alias statusText: statusText

    width: 360
    height: 360

    Button {
        id: startButton
        x: 29
        y: 37
        text: "Start"
    }

    Label {
        id: statusText
        x: 29
        y: 239
        width: 302
        height: 59
    }
}
