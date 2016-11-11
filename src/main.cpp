#include "applicationconfig.h"

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QCommandLineParser>
#include <QQmlContext>
#include <QDebug>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QCoreApplication::setApplicationName("farbsort");
    QCoreApplication::setApplicationVersion(APP_VERSION);

    // parse arguments
    QCommandLineParser parser;
    parser.setApplicationDescription("Farbsort helper");
    parser.addHelpOption();
    parser.addVersionOption();
    QCommandLineOption ipAddressOption(QStringList() << "i" << "ip-address", QCoreApplication::translate("main", "ip address to connect to websocket service"), "ip-address");
    ipAddressOption.setDefaultValue("127.0.0.1");
    parser.addOption(ipAddressOption);
    parser.process(app);

    qDebug() << "CommandLineOption::ipAddress: " << parser.value("ip-address");

    // start application
    QQmlApplicationEngine engine;

    ApplicationConfig config(parser.value("ip-address"));
    engine.rootContext()->setContextProperty("applicationConfig", &config);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    return app.exec();
}
