import QtQuick 2.0


Item {
    id: ejector
    width: 50
    height: 150

    property alias state: element.state

    Rectangle {
        id: surface
        anchors.fill: parent
        color: "grey"
        border.color: "black"
    }

    Rectangle {
        id: element
        height: 130
        width: 40
        x: 5
        y: 15
        color: "black"

        states:
            State {
                name: "ejecting"
                PropertyChanges { target: element; y: 100 }
            }
            State {
                name: "idle"
                PropertyChanges { target: element; y: 15 }
            }

        transitions: [
            Transition {
                from: "idle";
                to: "ejecting";
                animations: PropertyAnimation { property: "y"; easing.type: Easing.InOutQuad; duration: 250; }
                onRunningChanged: {
                    if( running == false)
                    {
                        element.state = "idle"
                    }
                }
            },
            Transition {
                from: "ejecting";
                to: "idle";
                animations: PropertyAnimation { property: "y"; easing.type: Easing.InOutQuad; duration: 1000; }
            }
        ]

        state: "idle"
    }
}
