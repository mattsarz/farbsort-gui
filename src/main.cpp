#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QResource>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QResource::registerResource("qml.qrc");
    QResource::registerResource("images.qrc");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
