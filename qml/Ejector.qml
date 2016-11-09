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

        transitions: Transition {
            PropertyAnimation { property: "y"; easing.type: Easing.InOutQuad; duration: {
                    if(state == "ejecting")
                        return 250;
                    else
                        return 1000; }
            }
        }

        state: "idle"
    }
}
