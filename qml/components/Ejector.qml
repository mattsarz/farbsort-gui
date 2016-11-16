import QtQuick 2.0


Item {
    id: ejector
    width: 40
    height: 150

    signal eject
    readonly property alias state: element.state

    onEject: {
        element.state = "ejecting"
    }

    Image {
        id: element
        anchors.fill: parent
        anchors.topMargin: 12
        anchors.leftMargin: 5
        anchors.rightMargin: 5
        source: "qrc:/ejector.svg"


        states:
            State {
                name: "ejecting"
                PropertyChanges { target: element; y: 100 }
            }
            State {
                name: "pulling"
                PropertyChanges { target: element; y: 15 }
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

    Rectangle {
        id: surface
        anchors.fill: parent
        anchors.bottomMargin: 10
        color: "#C4CACD"
        opacity: 0.5
    }
}
