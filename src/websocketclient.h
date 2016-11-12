#ifndef WEBSOCKETCLIENT_H
#define WEBSOCKETCLIENT_H

#include <QtCore/QObject>
#include <QtWebSockets/QWebSocket>

class WebSocketClient : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool connected READ connected NOTIFY connectedChanged)
    Q_PROPERTY(bool motorRunning READ motorRunning WRITE setMotorRunning NOTIFY motorRunningChanged)
    Q_PROPERTY(bool compressorRunning READ compressorRunning WRITE setCompressorRunning NOTIFY compressorRunningChanged)
    Q_PROPERTY(bool lightbarrierOneState READ lightbarrierOneState NOTIFY lightbarrierOneStateChanged)
    Q_PROPERTY(bool lightbarrierTwoState READ lightbarrierTwoState NOTIFY lightbarrierTwoStateChanged)
    Q_PROPERTY(bool lightbarrierThreeState READ lightbarrierThreeState NOTIFY lightbarrierThreeStateChanged)
    Q_PROPERTY(bool lightbarrierFourState READ lightbarrierFourState NOTIFY lightbarrierFourStateChanged)
    Q_PROPERTY(bool lightbarrierFiveState READ lightbarrierFiveState NOTIFY lightbarrierFiveStateChanged)

Q_SIGNALS:
    void connectedChanged();
    void motorRunningChanged();
    void compressorRunningChanged();
    void lightbarrierOneStateChanged();
    void lightbarrierTwoStateChanged();
    void lightbarrierThreeStateChanged();
    void lightbarrierFourStateChanged();
    void lightbarrierFiveStateChanged();

public:
    explicit WebSocketClient(const QString ipAddress);
    ~WebSocketClient();

public slots:
    /** slot to toggle the motor to switch on/off */
    void toggleMotorRunning();
    /** slot to toggle the compressor to switch on/off */
    void toggleCompressorRunning();
    /** slot to reconnect to websocket service */
    void reconnectService();

protected:
    bool connected() const { return m_connected; }
    void setMotorRunning(const bool motorRunning);
    bool motorRunning() const { return m_motorRunning; }
    void setCompressorRunning(const bool compressorRunning);
    bool compressorRunning() const { return m_compressorRunning; }
    bool lightbarrierOneState() const { return m_lightbarrierOneState; }
    bool lightbarrierTwoState() const { return m_lightbarrierTwoState; }
    bool lightbarrierThreeState() const { return m_lightbarrierThreeState; }
    bool lightbarrierFourState() const { return m_lightbarrierFourState; }
    bool lightbarrierFiveState() const { return m_lightbarrierFiveState; }
    /** sets the state for the given light barrier */
    void setLightbarrierState(const int number, const bool state);

private Q_SLOTS:
    void onConnected();
    void onDisconneced();
    void onTextMessageReceived(QString message);

private:
    // websocket stuff
    QWebSocket m_webSocket;
    const QUrl m_url;

    // members
    bool m_connected;
    bool m_motorRunning;
    bool m_compressorRunning;
    bool m_lightbarrierOneState;
    bool m_lightbarrierTwoState;
    bool m_lightbarrierThreeState;
    bool m_lightbarrierFourState;
    bool m_lightbarrierFiveState;
};

#endif // WEBSOCKETCLIENT_H
