#include "websocketclient.h"

#include <QtCore/QDebug>

WebSocketClient::WebSocketClient()
    : QObject(nullptr)
    , m_connected(false)
    , m_motorRunning(false)
    , m_compressorRunning(false)
    , m_lightbarrierOneState(false)
    , m_lightbarrierTwoState(false)
    , m_lightbarrierThreeState(false)
    , m_lightbarrierFourState(false)
    , m_lightbarrierFiveState(false)
    , m_detectedColor(QColor("transparent"))
{
}

void WebSocketClient::setMotorRunning(const bool motorRunning)
{
    if(motorRunning != m_motorRunning) {
        m_motorRunning = motorRunning;
        emit motorRunningChanged();
    }
}

void WebSocketClient::setCompressorRunning(const bool compressorRunning)
{
    if(compressorRunning != m_compressorRunning) {
        m_compressorRunning = compressorRunning;
        emit compressorRunningChanged();
    }
}

void WebSocketClient::setLightbarrierState(const int number, const bool state)
{
    switch(number) {
        case 1: {
            if(state != m_lightbarrierOneState) {
                qDebug() << "wsc: lightbarrierOneState changed " << state;
                m_lightbarrierOneState = state;
                emit lightbarrierOneStateChanged();
            } break;
        }
        case 2: {
            if(state != m_lightbarrierTwoState) {
                qDebug() << "wsc: lightbarrierTwpState changed " << state;
                m_lightbarrierTwoState = state;
                emit lightbarrierTwoStateChanged();
            } break;
        }
        case 3: {
            if(state != m_lightbarrierThreeState) {
                qDebug() << "wsc: lightbarrierThreeState changed " << state;
                m_lightbarrierThreeState = state;
                emit lightbarrierThreeStateChanged(state);
            } break;
        }
        case 4: {
            if(state != m_lightbarrierFourState) {
                qDebug() << "wsc: lightbarrierFourState changed " << state;
                m_lightbarrierFourState = state;
                emit lightbarrierFourStateChanged(state);
            } break;
        }
        case 5: {
            if(state != m_lightbarrierFiveState) {
                qDebug() << "wsc: lightbarrierFiveState changed " << state;
                m_lightbarrierFiveState = state;
                emit lightbarrierFiveStateChanged(state);
            } break;
        }
        default: {
            qWarning() << "wsc: received unknown lightbarrier state number: " << number;
        } break;
    }
}

void WebSocketClient::setDetectedColor(const QColor color)
{
    if(color != m_detectedColor) {
        m_detectedColor = color;
        emit detectedColorChanged();
    }
}

