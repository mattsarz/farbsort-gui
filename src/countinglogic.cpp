#include "countinglogic.h"

CountingLogic::CountingLogic()
  : QObject(nullptr)
  , m_redStoneCounter(0)
  , m_blueStoneCounter(0)
  , m_whiteStoneCounter(0)
{
}

void CountingLogic::trayOneLightbarrierActivated()
{
    m_redStoneCounter++;
    emit redStoneCounterChanged();
}

void CountingLogic::trayTwoLightbarrierActivated()
{
    m_blueStoneCounter++;
    emit blueStoneCounterChanged();
}

void CountingLogic::trayThreeLightbarrierActivated()
{
    m_whiteStoneCounter++;
    emit whiteStoneCounterChanged();
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
