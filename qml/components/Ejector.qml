import QtQuick 2.0


Item {
    id: ejector
    width: 40
    height: 150

    signal eject
    readonly property alias state: element.state
    property int ejectDistance: height / 2

    onEject: {
        element.state = "ejecting"
    }

    Rectangle {
        id: surface
        anchors.fill: parent
        anchors.bottomMargin: 10
        color: "#C4CACD"
        opacity: 0.5
    }

    Image {
        id: element
        x: surface.width / 8
        y: yOffset
        width: surface.width * 6 / 8
        height: surface.height - yOffset
        source: "qrc:/ejector.svg"

        readonly property int yOffset: surface.height / 10


        states:
            State {
                name: "ejecting"
                PropertyChanges { target: element; y: yOffset + ejectDistance }
            }
            State {
                name: "pulling"
                PropertyChanges { target: element; y: yOffset }
            }
            State {
                name: "idle"
            }

        transitions: [
            Transition {
                from: "idle";
                to: "ejecting";
                animations: PropertyAnimation { property: "y"; easing.type: Easing.InOutQuad; duration: 150; }
                onRunningChanged: {
                    if( running == false)
                    {
                        element.state = "pulling"
                    }
                }
            },
            Transition {
                from: "ejecting";
                to: "pulling";
                animations: PropertyAnimation { property: "y"; easing.type: Easing.InOutQuad; duration: 1000; }
                onRunningChanged: {
                    if( running == false)
                    {
                        element.state = "idle"
                    }
                }
            }
        ]

        state: "idle"
    }
}
