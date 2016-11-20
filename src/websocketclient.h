#ifndef WEBSOCKETCLIENT_H
#define WEBSOCKETCLIENT_H

#include <QtCore/QObject>
#include <QColor>

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
    Q_PROPERTY(QColor detectedColor READ detectedColor NOTIFY detectedColorChanged)

Q_SIGNALS:
    void connectedChanged();
    void motorRunningChanged();
    void compressorRunningChanged();
    void lightbarrierOneStateChanged();
    void lightbarrierTwoStateChanged();
    void lightbarrierThreeStateChanged();
    void lightbarrierFourStateChanged();
    void lightbarrierFiveStateChanged();
    void valveEjected(int number);
    void detectedColorChanged();

public:
    WebSocketClient();

public slots:
    /** slot to set the motor to switch on/off */
    virtual void sendMotorRunningRequest(const bool motorRunning) = 0;
    /** slot to set the compressor to switch on/off */
    virtual void sendCompressorRunningRequest(const bool compressorRunning) = 0;
    /** sends a eject valve request with the given number */
    virtual void ejectValve(int number) = 0;

protected:
    /** getters */
    bool connected() const { return m_connected; }
    bool motorRunning() const { return m_motorRunning; }
    bool compressorRunning() const { return m_compressorRunning; }
    bool lightbarrierOneState() const { return m_lightbarrierOneState; }
    bool lightbarrierTwoState() const { return m_lightbarrierTwoState; }
    bool lightbarrierThreeState() const { return m_lightbarrierThreeState; }
    bool lightbarrierFourState() const { return m_lightbarrierFourState; }
    bool lightbarrierFiveState() const { return m_lightbarrierFiveState; }
    QColor detectedColor() const { return m_detectedColor; }
    /** setters */
    void setMotorRunning(const bool motorRunning);
    void setCompressorRunning(const bool compressorRunning);
    /** sets the state for the given light barrier */
    void setLightbarrierState(const int number, const bool state);
    void setDetectedColor(const QColor color);

protected:
    bool m_connected;
    bool m_motorRunning;
    bool m_compressorRunning;
    bool m_lightbarrierOneState;
    bool m_lightbarrierTwoState;
    bool m_lightbarrierThreeState;
    bool m_lightbarrierFourState;
    bool m_lightbarrierFiveState;
    QColor m_detectedColor;
};

#endif // WEBSOCKETCLIENT_H
