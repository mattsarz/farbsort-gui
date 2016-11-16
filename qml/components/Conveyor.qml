import QtQuick 2.0

Item {
    id: conveyor
    width: 610
    height: 100

    property bool running: false
    property double velocity: 1.0

    Rectangle {
        id: background
        anchors.fill: parent
        color: "#6fd4ff"
        opacity: 0.21461188
        border.color: "black"

        Row {
            spacing: 30

            Repeater {
                id: repeater
                model: [0, 40, 80, 120, 160, 200, 240, 280, 320, 360, 400, 440, 480, 520, 560]
                delegate:
                    Rectangle {
                        id: beltElement
                        y: 5
                        x: startPosition
                        width: 10
                        height: conveyor.height -10
                        color: "#3d495a"

                        property int startPosition: modelData

                        SequentialAnimation on x {
                            loops: Animation.Infinite
                            running: conveyor.running

                            PropertyAnimation {
                                from: beltElement.startPosition
                                to: beltElement.startPosition + 40
                                duration: 1000 / conveyor.velocity;
                            }
                        }
                    }
            }
        }
    }
}
