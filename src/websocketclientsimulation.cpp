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

void WebSocketClientSimulation::lightbarrierActivated(int number, bool state)
{
    setLightbarrierState(number, state);
}

void WebSocketClientSimulation::sendDetectedColor(const QColor color)
{
    setDetectedColor(color);
}
