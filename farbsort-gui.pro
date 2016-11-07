TEMPLATE = app
CONFIG   -= app_bundle

QT += core qml quick websockets
CONFIG += c++11

SOURCES += src/main.cpp

RESOURCES += res/qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
target.path = /opt/$${TARGET}/bin
INSTALLS += target

DISTFILES += \
    farbsort-gui_git.bb
