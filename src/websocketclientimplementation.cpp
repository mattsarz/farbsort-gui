#include "websocketclientimplementation.h"

#include <QtCore/QDebug>
#include <QTimer>

WebSocketClientImplementation::WebSocketClientImplementation(const QString ipAddress)
    : m_url(QUrl("ws://" + ipAddress + ":8888/ws"))
{
    qDebug() << "wsc: WebSocketClient created:" << m_url;
    connect(&m_webSocket, &QWebSocket::connected, this, &WebSocketClientImplementation::onConnected);
    connect(&m_webSocket, &QWebSocket::disconnected, this, &WebSocketClientImplementation::onDisconneced);
    m_webSocket.open(m_url);
}

WebSocketClientImplementation::~WebSocketClientImplementation()
{
    m_webSocket.close();
}

void WebSocketClientImplementation::sendMotorRunningRequest(const bool motorRunning)
{
    if(motorRunning != m_motorRunning) {
        if(motorRunning) {
            m_webSocket.sendTextMessage("motor.start");
        } else {
            m_webSocket.sendTextMessage("motor.stop");
        }
    }
}

void WebSocketClientImplementation::sendCompressorRunningRequest(const bool compressorRunning)
{
    if(compressorRunning != m_compressorRunning) {
        if(compressorRunning) {
            m_webSocket.sendTextMessage("compressor.start");
        } else {
            m_webSocket.sendTextMessage("compressor.stop");
        }
    }
}

void WebSocketClientImplementation::ejectValve(int number)
{
    if(1 <= number && 3 >= number) {
        m_webSocket.sendTextMessage("valve" + QString::number(number) + ".eject");
    }
}

void WebSocketClientImplementation::reconnectService()
{
    qDebug() << "wsc: reconnect to service";
    m_webSocket.open(m_url);
}

void WebSocketClientImplementation::onConnected()
{
    qDebug() << "wsc: WebSocket connected";
    connect(&m_webSocket, &QWebSocket::textMessageReceived, this, &WebSocketClientImplementation::onTextMessageReceived);
    m_connected = true;
    emit connectedChanged();
}

void WebSocketClientImplementation::onDisconneced()
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

void WebSocketClientImplementation::onTextMessageReceived(QString message)
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
    } else if(message.startsWith("valve") && message.endsWith("ejected")) {
        QStringRef valveNumber(&message, 5, 1);
        emit valveEjected(valveNumber.toInt());
    } else {
        qWarning() << "wsc: message '" << message << "' was not handled";
    }
}

