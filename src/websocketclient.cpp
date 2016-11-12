#include "websocketclient.h"

#include <QtCore/QDebug>

QT_USE_NAMESPACE

WebSocketClient::WebSocketClient(const QString ipAddress)
    : QObject(NULL)
    , m_url(QUrl("ws://" + ipAddress + ":8888/ws"))
    , m_motorRunning(false)
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

void WebSocketClient::setMotorRunning(const bool motorRunning)
{
    if(motorRunning != m_motorRunning) {
        m_motorRunning = motorRunning;
        emit motorRunningChanged();
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
    qDebug() << "wsc: Message received";
    if(message.startsWith("motor")) {
        if(message.endsWith("started")) {
            qDebug() << "wsc: motor was started";
            setMotorRunning(true);
        } else {
            qDebug() << "wsc: motor was stopped";
            setMotorRunning(false);
        }
    }
}

