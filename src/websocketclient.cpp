#include "websocketclient.h"

#include <QtCore/QDebug>

QT_USE_NAMESPACE

WebSocketClient::WebSocketClient(const QString ipAddress)
    : QObject(NULL)
    , m_url(QUrl("ws://" + ipAddress + ":8888/ws"))
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

void WebSocketClient::onConnected()
{
    qDebug() << "wsc: WebSocket connected";
    connect(&m_webSocket, &QWebSocket::textMessageReceived, this, &WebSocketClient::onTextMessageReceived);
    m_webSocket.sendTextMessage(QStringLiteral("Hello, world!"));
}

void WebSocketClient::onTextMessageReceived(QString message)
{
    qDebug() << "wsc: received message: " << message;
    if(message.startsWith("motor")) {
        if(message.endsWith("started")) {
            qDebug() << "wsc: motor was started";
            setMotorRunning(true);
        } else {
            qDebug() << "wsc: motor was stopped";
            setMotorRunning(false);
        }
    } else if(message.startsWith("compressor")) {
        if(message.endsWith("started")) {
            qDebug() << "wsc: compressor was started";
            setCompressorRunning(true);
        } else {
            qDebug() << "wsc: compressor was stopped";
            setCompressorRunning(false);
        }
    } else if(message.startsWith("lightbarrier")) {
        bool lightbarrierState = false;
        if(message.endsWith("on")) {
            lightbarrierState = true;
        }
        QStringRef lightbarrierId(&message, 12, 1);
        qDebug() << "wsc: lightbarrier " << lightbarrierId << " state is " << lightbarrierState;
        switch(lightbarrierId.toInt()) {
            case 1: {
                if(lightbarrierState != m_lightbarrierOneState) {
                    qDebug() << "wsc: lightbarrierOneState changed";
                    m_lightbarrierOneState = lightbarrierState;
                    emit lightbarrierOneStateChanged();
                }
            }
            case 2: {
                if(lightbarrierState != m_lightbarrierTwoState) {
                    qDebug() << "wsc: lightbarrierTwoState changed";
                    m_lightbarrierTwoState = lightbarrierState;
                    emit lightbarrierTwoStateChanged();
                }
            }
            case 3: {
                if(lightbarrierState != m_lightbarrierThreeState) {
                    qDebug() << "wsc: lightbarrierThreeState changed";
                    m_lightbarrierThreeState = lightbarrierState;
                    emit lightbarrierThreeStateChanged();
                }
            }
            case 4: {
                if(lightbarrierState != m_lightbarrierFourState) {
                    qDebug() << "wsc: lightbarrierFourState changed";
                    m_lightbarrierFourState = lightbarrierState;
                    emit lightbarrierFourStateChanged();
                }
            }
            case 5: {
                if(lightbarrierState != m_lightbarrierFiveState) {
                    qDebug() << "wsc: lightbarrierFiveState changed";
                    m_lightbarrierFiveState = lightbarrierState;
                    emit lightbarrierFiveStateChanged();
                }
            }
            default: break;
        }
    }
}

