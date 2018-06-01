#ifndef AMPELSERVER_H
#define AMPELSERVER_H

#include <QtNetwork/QTcpServer>
#include <QObject>
#include "connectionhandler.h"
#include <QList>

class AmpelServer : public QObject
{
    Q_OBJECT

public:
    AmpelServer();

private:
    QTcpServer server;
    QList<ConnectionHandler*> connections;

public slots:
    void connection();

};

#endif // AMPELSERVER_H
