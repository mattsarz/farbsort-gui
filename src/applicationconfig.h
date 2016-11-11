#ifndef APPLICATIONCONFIG_H
#define APPLICATIONCONFIG_H

#include <QObject>

class ApplicationConfig : public QObject
{
    Q_OBJECT
public:
    ApplicationConfig(const QString ipAddress)
        : m_ipAddress(ipAddress) {}

    Q_INVOKABLE QString ipAddress() const {
        return m_ipAddress;
    }

private:
    const QString m_ipAddress;
};

#endif // APPLICATIONCONFIG_H
