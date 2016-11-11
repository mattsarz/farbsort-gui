import QtQuick 2.0


Item {
    id: ejector
    width: 50
    height: 150

    signal eject
    readonly property alias state: element.state

    Rectangle {
        id: surface
        anchors.fill: parent
        color: "lightgrey"
        border.color: "black"
    }

    onEject: {
        element.state = "ejecting"
    }

    Rectangle {
        id: element
        height: 130
        width: 40
        x: 5
        y: 15
        color: "grey"

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
}
