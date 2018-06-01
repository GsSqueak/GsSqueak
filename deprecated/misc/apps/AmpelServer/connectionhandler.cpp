#include "connectionhandler.h"
#include <QDebug>
#include <string>

using namespace std;


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

    string params = "";

    if(in.contains("redon"))
        params += " -o 3";
    else if(in.contains("redoff"))
        params += " -f 3";

    if(in.contains("greenon"))
        params += " -o 4";
    else if(in.contains("greenoff"))
        params += " -f 4";

    if (!params.empty())
        process.start(("sispmctl" + params).c_str());
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
