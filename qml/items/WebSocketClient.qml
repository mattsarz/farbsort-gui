import QtQuick 2.0
import Qt.WebSockets 1.0

Item {
    id: client
    property bool connected: false

    property bool compressorSwitchedOn: false

    property bool lightBarrierOneInterrupted: false
    property bool lightBarrierTwoInterrupted: false
    property bool lightBarrierThreeInterrupted: false
    property bool lightBarrierFourInterrupted: false
    property bool lightBarrierFiveInterrupted: false

    // handles a lightbarrier message
    // parses the content of the message and sets the state accordingly
    function handleLightbarrierMessage(message) {
        var elements = message.split("=");
        var state = (elements[1] === "on");
        var id = parseInt(elements[0].charAt(12));
        switch(id) {
        case 1:
            lightBarrierOneInterrupted = state
            return true;
        case 2:
            lightBarrierTwoInterrupted = state
            return true;
        case 3:
            lightBarrierThreeInterrupted = state
            return true;
        case 4:
            lightBarrierFourInterrupted = state
            return true;
        case 5:
            lightBarrierFiveInterrupted = state
            return true;
        default:
            console.error("lightbarrier id '" + id + "' unknown")
            return false;
        }
    }

    WebSocket {
        id: websocket
        url: "ws://" + applicationConfig.ipAddress() + ":8888/ws"

        onTextMessageReceived: {
            if(message == "compressor.started") {
                client.compressorSwitchedOn = true;
                console.log("compressor is switched on");
            } else if(message == "compressor.stopped") {
                client.compressorSwitchedOn = false;
                console.log("compressor is switched off");
            } else if (message.substring(0, 12) == "lightbarrier" ){
                if(handleLightbarrierMessage(message))
                    console.log("lightbarrier state received")
                else
                    console.log("lightbarrier state with unknown id received")
            } else {
                console.log("received unhandled message: " + message)
            }
        }

        onStatusChanged: {
            if (websocket.status == WebSocket.Error) {
                console.log("Error: " + websocket.errorString)
            } else if (websocket.status == WebSocket.Open) {
                console.log("Websocket opened");
                sendTextMessage("")
            } else if (websocket.status == WebSocket.Closed) {
                console.log("Websocked closed");
            }

            connected = (websocket.status == WebSocket.Open)
            console.log("connected state: " + connected)
        }
        active: true
    }

    onCompressorSwitchedOnChanged: {
        if(compressorSwitchedOn) {
            websocket.sendTextMessage("compressor.start");
        } else {
            websocket.sendTextMessage("compressor.stop");
        }
    }
}
