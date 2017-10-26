#include "connectionhandler.h"
#include <QDebug>


ConnectionHandler::ConnectionHandler(QTcpSocket *socketP):
socket(socketP)
{
    connect(socket,SIGNAL(readyRead()),this,SLOT(read()));
    connect(socket,SIGNAL(disconnected()),this,SLOT(del()));
    connect(&process,SIGNAL(finished(int)),this,SLOT(processFinished()));
}

void ConnectionHandler::read()
{
    QString in(socket->readAll());
    qDebug() << in;
    if(in.contains("redon"))
        process.start("sispmctl -o 3");
    else if(in.contains("redoff"))
        process.start("sispmctl -f 3");
    else if(in.contains("greenon"))
        process.start("sispmctl -o 4");
    else if(in.contains("greenoff"))
        process.start("sispmctl -f 4");
}

void ConnectionHandler::del()
{
    if(process.state() != QProcess::NotRunning){
        delReq = true;
        return;
    }
    deleteLater();
}

void ConnectionHandler::processFinished()
{
    if(delReq)
        deleteLater();
}
