#ifndef WEBSOCKETCLIENT_H
#define WEBSOCKETCLIENT_H

#include <QtCore/QObject>
#include <QtWebSockets/QWebSocket>

class WebSocketClient : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool motorRunning READ motorRunning WRITE setMotorRunning NOTIFY motorRunningChanged)
    Q_PROPERTY(bool compressorRunning READ compressorRunning WRITE setCompressorRunning NOTIFY compressorRunningChanged)

Q_SIGNALS:
    void motorRunningChanged();
    void compressorRunningChanged();

public:
    explicit WebSocketClient(const QString ipAddress);
    ~WebSocketClient();

public slots:
    /** slot to toggle the motor to switch on/off */
    void toggleMotorRunning();
    /** slot to toggle the compressor to switch on/off */
    void toggleCompressorRunning();

protected:
    void setMotorRunning(const bool motorRunning);
    bool motorRunning() const { return m_motorRunning; }
    void setCompressorRunning(const bool compressorRunning);
    bool compressorRunning() const { return m_compressorRunning; }

private Q_SLOTS:
    void onConnected();
    void onTextMessageReceived(QString message);

private:
    // websocket stuff
    QWebSocket m_webSocket;
    const QUrl m_url;

    // members
    bool m_motorRunning;
    bool m_compressorRunning;
};

#endif // WEBSOCKETCLIENT_H
