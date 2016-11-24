#include "countinglogic.h"

#include <QDebug>

CountingLogic::CountingLogic()
  : QObject(nullptr)
  , m_redStoneCounter(0)
  , m_blueStoneCounter(0)
  , m_whiteStoneCounter(0)
  , m_trayOneColor(0x1E,0x90,0xFF) // dogerblue
  , m_trayTwoColor(Qt::red)
  , m_trayThreeColor(Qt::white)
{
}

void CountingLogic::trayOneLightbarrierActivationChanged(const bool active)
{
    if(active) {
        incrementStoneCounter(trayOneColor());
    }
}

void CountingLogic::trayTwoLightbarrierActivationChanged(const bool active)
{
    if(active) {
        incrementStoneCounter(trayTwoColor());
    }
}

void CountingLogic::trayThreeLightbarrierActivationChanged(const bool active)
{
    if(active) {
        incrementStoneCounter(trayThreeColor());
    }
}

void CountingLogic::resetRedStoneCounter()
{
    if(0 != m_redStoneCounter) {
        m_redStoneCounter = 0;
        emit redStoneCounterChanged();
    }
}

void CountingLogic::resetBlueStoneCounter()
{
    if(0 != m_blueStoneCounter) {
        m_blueStoneCounter = 0;
        emit blueStoneCounterChanged();
    }
}

void CountingLogic::resetWhiteStoneCounter()
{
    if(0 != m_whiteStoneCounter) {
        m_whiteStoneCounter = 0;
        emit whiteStoneCounterChanged();
    }
}

void CountingLogic::setTrayOneColor(const QColor color)
{
    if(color != m_trayOneColor) {
        m_trayOneColor = color;
        emit trayOneColorChanged();
    }
}

void CountingLogic::setTrayTwoColor(const QColor color)
{
    if(color != m_trayTwoColor) {
        m_trayTwoColor = color;
        emit trayTwoColorChanged();
    }
}

void CountingLogic::setTrayThreeColor(const QColor color)
{
    if(color != m_trayThreeColor) {
        m_trayThreeColor = color;
        emit trayThreeColorChanged();
    }
}

void CountingLogic::incrementStoneCounter(const QColor color)
{
    if(color == QColor(Qt::blue)) {
        m_blueStoneCounter++;
        emit blueStoneCounterChanged();
    } else if(color == QColor(Qt::red)) {
        m_redStoneCounter++;
        emit redStoneCounterChanged();
    } else if(color == QColor(Qt::white)) {
        m_whiteStoneCounter++;
        emit whiteStoneCounterChanged();
    } else {
        qCritical() << "received untracked color: " << color;
    }

}
