#include "ampelserver.h"
#include <QtNetwork/QTcpSocket>


AmpelServer::AmpelServer()
{
    if(!server.listen(QHostAddress::Any,9876)){
        qDebug() << "filed setting up server";
    }

    connect(&server,SIGNAL(newConnection()),this,SLOT(connection()));
}

void AmpelServer::connection()
{
    qDebug() << "got connection";
    while(server.hasPendingConnections()){

        QTcpSocket* socket = server.nextPendingConnection();
        new ConnectionHandler(socket);
    }
}
