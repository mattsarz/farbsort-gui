import QtQuick 2.0

Item {
    id: conveyor
    width: 610
    height: 100

    property bool running: false
    property double velocity: 1.0

    Rectangle {
        id: conveyorArea
        anchors.fill: parent
        color: "#6fd4ff"
        opacity: 0.21461188
        border.color: "black"

        property int numberOfElements: 15
        property int beltElementWidth: conveyor.width / 61
        property double offsetBetweenBeltElements: (conveyor.width - beltElementWidth) / numberOfElements

        signal resized

        onWidthChanged: {
            resized()
        }

        Row {
            spacing: 30

            Repeater {
                id: repeater
                model: conveyorArea.numberOfElements
                delegate:
                    Rectangle {
                        id: beltElement
                        y: 5
                        x: startPosition
                        width: conveyorArea.beltElementWidth
                        height: conveyorArea.height -10
                        color: "#3d495a"

                        property int index: modelData
                        readonly property double startPosition: index * conveyorArea.offsetBetweenBeltElements

                        function restartAnimation() {
                            animation.restart()
                            if(!conveyor.running) {
                                animation.stop()
                            }
                        }

                        SequentialAnimation on x {
                            id: animation
                            loops: Animation.Infinite
                            running: conveyor.running

                            PropertyAnimation {
                                from: beltElement.startPosition
                                to: beltElement.startPosition + conveyorArea.offsetBetweenBeltElements
                                duration: 1000 / conveyor.velocity;
                            }
                        }

                        Component.onCompleted: {
                            conveyorArea.resized.connect(restartAnimation)
                        }
                    }
            }
        }
    }
}
