#include "countinglogic.h"

CountingLogic::CountingLogic()
  : QObject(nullptr)
  , m_redStoneCounter(0)
  , m_blueStoneCounter(0)
  , m_whiteStoneCounter(0)
{
}

void CountingLogic::trayOneLightbarrierActivationChanged(const bool active)
{
    if(active) {
        m_redStoneCounter++;
        emit redStoneCounterChanged();
    }
}

void CountingLogic::trayTwoLightbarrierActivationChanged(const bool active)
{
    if(active) {
        m_blueStoneCounter++;
        emit blueStoneCounterChanged();
    }
}

void CountingLogic::trayThreeLightbarrierActivationChanged(const bool active)
{
    if(active) {
        m_whiteStoneCounter++;
        emit whiteStoneCounterChanged();
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
