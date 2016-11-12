#include "websocketclient.h"

#include <QtCore/QDebug>
#include <QTimer>

WebSocketClient::WebSocketClient(const QString ipAddress)
    : QObject(NULL)
    , m_url(QUrl("ws://" + ipAddress + ":8888/ws"))
    , m_connected(false)
    , m_motorRunning(false)
    , m_compressorRunning(false)
    , m_lightbarrierOneState(false)
    , m_lightbarrierTwoState(false)
    , m_lightbarrierThreeState(false)
    , m_lightbarrierFourState(false)
    , m_lightbarrierFiveState(false)
{
    qDebug() << "wsc: WebSocketClient created:" << m_url;
    connect(&m_webSocket, &QWebSocket::connected, this, &WebSocketClient::onConnected);
    connect(&m_webSocket, &QWebSocket::disconnected, this, &WebSocketClient::onDisconneced);
    m_webSocket.open(m_url);
}

WebSocketClient::~WebSocketClient()
{
    m_webSocket.close();
}

void WebSocketClient::toggleMotorRunning()
{
    qDebug() << "wsc: toggle motor running";
    if(m_motorRunning) {
        m_webSocket.sendTextMessage("motor.stop");
    } else {
        m_webSocket.sendTextMessage("motor.start");
    }
}

void WebSocketClient::toggleCompressorRunning()
{
    qDebug() << "wsc: toggle compressor running";
    if(m_compressorRunning) {
        m_webSocket.sendTextMessage("compressor.stop");
    } else {
        m_webSocket.sendTextMessage("compressor.start");
    }
}

void WebSocketClient::reconnectService()
{
    qDebug() << "wsc: reconnect to service";
    m_webSocket.open(m_url);
}

void WebSocketClient::setMotorRunning(const bool motorRunning)
{
    if(motorRunning != m_motorRunning) {
        m_motorRunning = motorRunning;
        emit motorRunningChanged();
    }
}

void WebSocketClient::setCompressorRunning(const bool compressorRunning)
{
    if(compressorRunning != m_compressorRunning) {
        m_compressorRunning = compressorRunning;
        emit compressorRunningChanged();
    }
}

void WebSocketClient::setLightbarrierState(const int number, const bool state)
{
    switch(number) {
        case 1: {
            if(state != m_lightbarrierOneState) {
                qDebug() << "wsc: lightbarrierOneState changed " << state;
                m_lightbarrierOneState = state;
                emit lightbarrierOneStateChanged();
            } break;
        }
        case 2: {
            if(state != m_lightbarrierTwoState) {
                qDebug() << "wsc: lightbarrierTwpState changed " << state;
                m_lightbarrierTwoState = state;
                emit lightbarrierTwoStateChanged();
            } break;
        }
        case 3: {
            if(state != m_lightbarrierThreeState) {
                qDebug() << "wsc: lightbarrierThreeState changed " << state;
                m_lightbarrierThreeState = state;
                emit lightbarrierThreeStateChanged();
            } break;
        }
        case 4: {
            if(state != m_lightbarrierFourState) {
                qDebug() << "wsc: lightbarrierFourState changed " << state;
                m_lightbarrierFourState = state;
                emit lightbarrierFourStateChanged();
            } break;
        }
        case 5: {
            if(state != m_lightbarrierFiveState) {
                qDebug() << "wsc: lightbarrierFiveState changed " << state;
                m_lightbarrierFiveState = state;
                emit lightbarrierFiveStateChanged();
            } break;
        }
        default: {
            qWarning() << "wsc: received unknown lightbarrier state number: " << number;
        } break;
    }
}

void WebSocketClient::onConnected()
{
    qDebug() << "wsc: WebSocket connected";
    connect(&m_webSocket, &QWebSocket::textMessageReceived, this, &WebSocketClient::onTextMessageReceived);
    m_connected = true;
    emit connectedChanged();
}

void WebSocketClient::onDisconneced()
{
    qDebug() << "wsc: WebSocket disconnected";
    m_connected = false;
    emit connectedChanged();
    setMotorRunning(false);
    setCompressorRunning(false);
    for(int number = 1; number <= 5; number++) {
        setLightbarrierState(number, false);
    }
    QTimer::singleShot(1000, this, SLOT(reconnectService()));
}

void WebSocketClient::onTextMessageReceived(QString message)
{
    qDebug() << "wsc: received message: " << message;
    if(message.startsWith("motor")) {
        setMotorRunning(message.endsWith("started"));
    } else if(message.startsWith("compressor")) {
        setCompressorRunning(message.endsWith("started"));
    } else if(message.startsWith("lightbarrier")) {
        const bool lightbarrierState = message.endsWith("on");
        QStringRef lightbarrierNumber(&message, 12, 1);
        setLightbarrierState(lightbarrierNumber.toInt(), lightbarrierState);
    }
}

