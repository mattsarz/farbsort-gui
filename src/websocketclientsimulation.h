#ifndef WEBSOCKETCLIENTSIMULATION_H
#define WEBSOCKETCLIENTSIMULATION_H

#include "websocketclient.h"

class WebSocketClientSimulation : public WebSocketClient
{
    Q_OBJECT
public:
    WebSocketClientSimulation();

public slots:
    /** slot to set the motor to switch on/off */
    void sendMotorRunningRequest(const bool motorRunning) override;
    /** slot to set the compressor to switch on/off */
    void sendCompressorRunningRequest(const bool compressorRunning) override;
    /** sends a eject valve request with the given number */
    void ejectValve(int number) override;
    /** slot to set the motor to switch on/off */
    void simulateLightbarrierActivated(int number);

private slots:
    /** slot to reset lightbarrier one state */
    void resetLightbarrierOneState();
    /** slot to reset lightbarrier two state */
    void resetLightbarrierTwoState();
    /** slot to reset lightbarrier three state */
    void resetLightbarrierThreeState();
    /** slot to reset lightbarrier four state */
    void resetLightbarrierFourState();
    /** slot to reset lightbarrier five state */
    void resetLightbarrierFiveState();
};

#endif // WEBSOCKETCLIENTSIMULATION_H
