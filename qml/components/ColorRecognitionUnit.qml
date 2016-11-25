import QtQuick 2.0

Rectangle {
    id: colorRecongnition
    property alias detectedColor: colorDetection.color
    border.color: "gray"
    opacity: 0.4
    color: "#0e6a8b"
    state: "NOTDETECT"

    MouseArea {
        anchors.fill: parent
        onPressed: colorRecongnition.state = "DETECT"
        onReleased: colorRecongnition.state = "NOTDETECT"
    }

    states: [
        State {
            name: "DETECT"
            PropertyChanges { target: colorRecongnition; color: "yellow"}
        },
        State {
            name: "NOTDETECT"
            PropertyChanges { target: colorRecongnition; color: "#0e6a8b"}
        }
    ]

    transitions: [
        Transition {
            from: "NOTDETECT"
            to: "DETECT"
            ColorAnimation { target: colorRecongnition; duration: 100}
        },
        Transition {
            from: "DETECT"
            to: "NOTDETECT"
            ColorAnimation { target: colorRecongnition; duration: 500}
        }
    ]

    Stone {
        id: colorDetection
        height: colorRecongnition.height / 5
        width: height
        y: colorRecongnition.height - height * 1.2
        x: (colorRecongnition.width - width) / 2
        // visible: { color.a > 0 }
    }

    function onColorDetected() {
        colorRecongnition.state = DETECT
    }

    Component.onCompleted: {
        websocketClient.detectedColorChanged.connect(onColorDetected)
    }
}
