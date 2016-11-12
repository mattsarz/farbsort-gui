#ifndef WEBSOCKETCLIENT_H
#define WEBSOCKETCLIENT_H

#include <QtCore/QObject>
#include <QtWebSockets/QWebSocket>

class WebSocketClient : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool motorRunning READ motorRunning WRITE setMotorRunning NOTIFY motorRunningChanged)

Q_SIGNALS:
    void motorRunningChanged();

public:
    explicit WebSocketClient(const QString ipAddress);
    ~WebSocketClient();

public slots:
    /**
     * @brief slot to toggle the motor to switch on/off
     */
    void toggleMotorRunning();

protected:
    void setMotorRunning(const bool motorRunning);
    bool motorRunning() const { return m_motorRunning; }

private Q_SLOTS:
    void onConnected();
    void onTextMessageReceived(QString message);

private:
    // websocket stuff
    QWebSocket m_webSocket;
    const QUrl m_url;

    // members
    bool m_motorRunning;
};

#endif // WEBSOCKETCLIENT_H
