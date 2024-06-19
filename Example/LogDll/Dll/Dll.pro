QT += core xml network concurrent

LOG4QT_ROOT = $$PWD/../../../3rd/Log4Qt

include($$LOG4QT_ROOT/build.pri)
include($$LOG4QT_ROOT/g++.pri)
include($$LOG4QT_ROOT/src/log4qt/log4qt.pri)

CONFIG += c++14 \
          hide_symbols

contains(DEFINES, LOG4QT_STATIC) {
    message(Building static log4qt...)
    CONFIG += staticlib
}

TEMPLATE = lib
TARGET = log4qt
QT -= gui

# .. is needed for msvc since it is treating '.' as the directory of the current file
# and not the directory where the compiled source is found
INCLUDEPATH += .. .
INCLUDEPATH += $$LOG4QT_ROOT/src
INCLUDEPATH += $$LOG4QT_ROOT/src/log4qt

DESTDIR = $$PWD/../Log/Bin
DEFINES += NOMINMAX QT_DEPRECATED_WARNINGS QT_NO_CAST_FROM_BYTEARRAY QT_USE_QSTRINGBUILDER
DEFINES += LOG4QT_LIBRARY

