#ifndef EVENTLOG_H
#define EVENTLOG_H

#include <QAbstractListModel>
#include <QList>
#include <QColor>

class LogEntry
{
public:
    enum class LogLevel {
        Info,
        Warning,
        Error
    };

    LogEntry(const QString message, const LogLevel logLevel = LogLevel::Info, const QString no = "", const QColor color = Qt::transparent);
    QString message() const;
    QString no() const;
    QString icon() const;
    QString color() const;
    QString date() const;

private:
    QString m_message;
    QString m_no;
    QString m_icon;
    QString m_color;
    QString m_date;
};


class EventLog : public QAbstractListModel
{
    Q_OBJECT

public:
    enum EventLogRoles {
        IconRole = Qt::UserRole + 1,
        DateRole,
        NoRole,
        ColorRole,
        MessageRole,
    };

    EventLog();
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

public slots:
    void addLogEntry(const QString message, const LogEntry::LogLevel logLevel, const QString no, const QColor color);

protected:
    QHash<int, QByteArray> roleNames() const;

private:
    QList<LogEntry> m_logEntries;
};

#endif // EVENTLOG_H

