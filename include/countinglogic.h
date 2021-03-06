#ifndef COUNTINGLOGIC_H
#define COUNTINGLOGIC_H

#include <QObject>
#include <QColor>

class CountingLogic : public QObject
{
    Q_OBJECT
    // counters
    Q_PROPERTY(unsigned int redStoneCounter READ redStoneCounter RESET resetRedStoneCounter  NOTIFY redStoneCounterChanged)
    Q_PROPERTY(unsigned int blueStoneCounter READ blueStoneCounter RESET resetBlueStoneCounter  NOTIFY blueStoneCounterChanged)
    Q_PROPERTY(unsigned int whiteStoneCounter READ whiteStoneCounter RESET resetWhiteStoneCounter  NOTIFY whiteStoneCounterChanged)
    // color assignment
    Q_PROPERTY(QColor trayOneColor READ trayOneColor WRITE setTrayOneColor  NOTIFY trayOneColorChanged)
    Q_PROPERTY(QColor trayTwoColor READ trayTwoColor WRITE setTrayTwoColor  NOTIFY trayTwoColorChanged)
    Q_PROPERTY(QColor trayThreeColor READ trayThreeColor WRITE setTrayThreeColor  NOTIFY trayThreeColorChanged)

public:
    explicit CountingLogic();

signals:
    void redStoneCounterChanged();
    void blueStoneCounterChanged();
    void whiteStoneCounterChanged();
    void trayOneColorChanged();
    void trayTwoColorChanged();
    void trayThreeColorChanged();

public slots:
    void trayOneLightbarrierActivationChanged(const bool active);
    void trayTwoLightbarrierActivationChanged(const bool active);
    void trayThreeLightbarrierActivationChanged(const bool active);

protected:
    // getter
    int redStoneCounter() const { return m_redStoneCounter; }
    int blueStoneCounter() const { return m_blueStoneCounter; }
    int whiteStoneCounter() const { return m_whiteStoneCounter; }
    QColor trayOneColor() const { return m_trayOneColor; }
    QColor trayTwoColor() const { return m_trayTwoColor; }
    QColor trayThreeColor() const { return m_trayThreeColor; }
    // setter
    void resetRedStoneCounter();
    void resetBlueStoneCounter();
    void resetWhiteStoneCounter();
    void setTrayOneColor(const QColor color);
    void setTrayTwoColor(const QColor color);
    void setTrayThreeColor(const QColor color);
    // helpers
    void incrementStoneCounter(const QColor color);

private:
    unsigned int m_redStoneCounter;
    unsigned int m_blueStoneCounter;
    unsigned int m_whiteStoneCounter;
    QColor m_trayOneColor;
    QColor m_trayTwoColor;
    QColor m_trayThreeColor;
};

#endif // COUNTINGLOGIC_H

