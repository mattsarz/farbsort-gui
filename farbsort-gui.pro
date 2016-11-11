TEMPLATE = app
CONFIG   -= app_bundle

QT += core qml quick websockets
CONFIG += c++11

VERSION = 0.1
DEFINES += APP_VERSION=\\\"$$VERSION\\\"

SOURCES += src/main.cpp

HEADERS += \
    src/applicationconfig.h

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
	qml/screens/MainScreen.qml \
	qml/items/Simulator.qml \
	qml/items/WebSocketClient.qml \
    qml/screens/SettingsScreen.qml \
    qml/screens/DiagnosticScreen.qml
