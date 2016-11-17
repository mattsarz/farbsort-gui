#include "websocketclientsimulation.h"

#include <QtCore/QTimer>
#include <QtCore/QDebug>

const int LIGHTBARRIER_ACTIVATION_TIMEOUT = 200;

WebSocketClientSimulation::WebSocketClientSimulation()
{
    m_connected = true;
}

void WebSocketClientSimulation::sendMotorRunningRequest(const bool motorRunning)
{
    setMotorRunning(motorRunning);
}

void WebSocketClientSimulation::sendCompressorRunningRequest(const bool compressorRunning)
{
    setCompressorRunning(compressorRunning);
}

void WebSocketClientSimulation::ejectValve(int number)
{
    emit valveEjected(number);
}

void WebSocketClientSimulation::simulateLightbarrierActivated(int number)
{
    setLightbarrierState(number, true);
    switch(number) {
    case 1: {
        QTimer::singleShot(LIGHTBARRIER_ACTIVATION_TIMEOUT, this, SLOT(resetLightbarrierOneState()));
    } break;
    case 2: {
        QTimer::singleShot(LIGHTBARRIER_ACTIVATION_TIMEOUT, this, SLOT(resetLightbarrierTwoState()));
    } break;
    case 3: {
        QTimer::singleShot(LIGHTBARRIER_ACTIVATION_TIMEOUT, this, SLOT(resetLightbarrierThreeState()));
    } break;
    case 4: {
        QTimer::singleShot(LIGHTBARRIER_ACTIVATION_TIMEOUT, this, SLOT(resetLightbarrierFourState()));
    } break;
    case 5: {
        QTimer::singleShot(LIGHTBARRIER_ACTIVATION_TIMEOUT, this, SLOT(resetLightbarrierFiveState()));
    } break;
    default: {}
    }
}

void WebSocketClientSimulation::resetLightbarrierOneState()
{
    setLightbarrierState(1, false);
}

void WebSocketClientSimulation::resetLightbarrierTwoState()
{
    setLightbarrierState(2, false);
}

void WebSocketClientSimulation::resetLightbarrierThreeState()
{
    setLightbarrierState(3, false);
}

void WebSocketClientSimulation::resetLightbarrierFourState()
{
    setLightbarrierState(4, false);
}

void WebSocketClientSimulation::resetLightbarrierFiveState()
{
    setLightbarrierState(5, false);
}
