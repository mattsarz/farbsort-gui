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
};

#endif // WEBSOCKETCLIENTSIMULATION_H
