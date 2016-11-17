#include "websocketclientsimulation.h"

#include <QtCore/QDebug>

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
