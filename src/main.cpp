#include "websocketclientimplementation.h"
#include "websocketclientsimulation.h"
#include "countinglogic.h"

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QResource>
#include <QCommandLineParser>
#include <QQmlContext>
#include <QDebug>
#include <QSharedPointer>

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
    QCommandLineOption ipAddressOption(QStringList() << "ip-address", QCoreApplication::translate("main", "ip address to connect to websocket service"), "ip-address");
    ipAddressOption.setDefaultValue("127.0.0.1");
    parser.addOption(ipAddressOption);
    QCommandLineOption simulationOption(QStringList() << "simulation", QCoreApplication::translate("main", "sets the webclient socket into simulation mode"));
    parser.addOption(simulationOption);
    parser.process(app);

    qDebug() << "CommandLineOption::ipAddress: " << parser.value("ip-address");

    QSharedPointer<WebSocketClient> webSocketClient;
    if(parser.isSet("simulation")) {
        webSocketClient.reset(new WebSocketClientSimulation());
    } else {
        webSocketClient.reset(new WebSocketClientImplementation(QString(parser.value("ip-address"))));
    }

    CountingLogic countingLogic;
    QObject::connect(webSocketClient.data(), SIGNAL(lightbarrierThreeStateChanged()), &countingLogic, SLOT(trayOneLightbarrierActivated()));
    QObject::connect(webSocketClient.data(), SIGNAL(lightbarrierFourStateChanged()), &countingLogic, SLOT(trayTwoLightbarrierActivated()));
    QObject::connect(webSocketClient.data(), SIGNAL(lightbarrierFiveStateChanged()), &countingLogic, SLOT(trayThreeLightbarrierActivated()));

    // start application
    QResource::registerResource("qml.qrc");
    QResource::registerResource("images.qrc");

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("websocketClient", webSocketClient.data());
    engine.rootContext()->setContextProperty("simulationModeActive", QVariant(parser.isSet("simulation")));
    engine.rootContext()->setContextProperty("countingLogic", &countingLogic);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    return app.exec();
}
