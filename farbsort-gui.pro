TEMPLATE = app
CONFIG   -= app_bundle

QT += core qml quick websockets
CONFIG += c++11

VERSION = 0.1
DEFINES += APP_VERSION=\\\"$$VERSION\\\"

SOURCES += src/main.cpp \
    src/websocketclientimplementation.cpp \
    src/websocketclient.cpp \
    src/websocketclientsimulation.cpp

HEADERS += \
    src/websocketclient.h \
    src/websocketclientimplementation.h \
    src/websocketclientsimulation.h

RESOURCES += res/qml.qrc \
    res/images.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
target.path = /opt/$${TARGET}/bin
INSTALLS += target

OTHER_FILES +=

DISTFILES += \
    farbsort-gui_git.bb \
    qml/main.qml \
    qml/components/Conveyor.qml \
    qml/components/Ejector.qml \
    qml/components/Tray.qml \
    qml/screens/MainScreen.qml \
    qml/items/Simulator.qml \
    qml/items/WebSocketClient.qml \
    qml/screens/SettingsScreen.qml \
    qml/screens/DiagnosticScreen.qml \
    qml/screens/MainScreen/MainTitleBar.qml \
    qml/controls/TestControl.qml \
    qml/controls/StartStopControl.qml \
    qml/controls/ToggleButton.qml \
    qml/controls/EmergencyButton.qml \
    qml/Style.qml \
    qml/qmldir \
    qml/components/Legend.qml \
    qml/components/Statistic.qml \
    qml/components/Status.qml \
    qml/components/LightBarrier.qml \
    qml/components/Stone.qml

lupdate_only{
SOURCES += $${DISTFILES}
}
