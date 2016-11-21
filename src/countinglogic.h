#ifndef COUNTINGLOGIC_H
#define COUNTINGLOGIC_H

#include <QObject>
#include <QColor>

class CountingLogic : public QObject
{
    Q_OBJECT
    Q_PROPERTY(unsigned int redStoneCounter READ redStoneCounter RESET resetRedStoneCounter  NOTIFY redStoneCounterChanged)
    Q_PROPERTY(unsigned int blueStoneCounter READ blueStoneCounter RESET resetBlueStoneCounter  NOTIFY blueStoneCounterChanged)
    Q_PROPERTY(unsigned int whiteStoneCounter READ whiteStoneCounter RESET resetWhiteStoneCounter  NOTIFY whiteStoneCounterChanged)
public:
    explicit CountingLogic();

signals:
    void redStoneCounterChanged();
    void blueStoneCounterChanged();
    void whiteStoneCounterChanged();

public slots:
    void trayOneLightbarrierActivated();
    void trayTwoLightbarrierActivated();
    void trayThreeLightbarrierActivated();

protected:
    /// getter
    int redStoneCounter() const { return m_redStoneCounter; }
    int blueStoneCounter() const { return m_blueStoneCounter; }
    int whiteStoneCounter() const { return m_whiteStoneCounter; }
    /// setter
    void resetRedStoneCounter();
    void resetBlueStoneCounter();
    void resetWhiteStoneCounter();

private:
    unsigned int m_redStoneCounter;
    unsigned int m_blueStoneCounter;
    unsigned int m_whiteStoneCounter;
};

#endif // COUNTINGLOGIC_H
