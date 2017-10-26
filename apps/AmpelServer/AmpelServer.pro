QT += core
QT += network
QT -= gui

CONFIG += c++11

TARGET = AmpelServer
CONFIG += console
CONFIG -= app_bundle

TEMPLATE = app

SOURCES += main.cpp \
    ampelserver.cpp \
    connectionhandler.cpp

HEADERS += \
    ampelserver.h \
    connectionhandler.h
