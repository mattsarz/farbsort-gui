TEMPLATE = app
CONFIG   -= app_bundle

QT += core qml quick websockets
CONFIG += c++11

SOURCES += src/main.cpp

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
	qml/Simulator.qml \
	qml/WebSocketClient.qml \
	qml/components/Conveyor.qml \
	qml/components/Ejector.qml \
    qml/screens/MainScreen.qml


