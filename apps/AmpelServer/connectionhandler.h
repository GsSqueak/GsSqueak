#ifndef CONNECTIONHANDLER_H
#define CONNECTIONHANDLER_H

#include <QtNetwork/QTcpSocket>
#include <QProcess>

class ConnectionHandler : public QObject
{
Q_OBJECT

public:
    ConnectionHandler(QTcpSocket* socketP);

private:
    QTcpSocket* socket;
    QProcess process;

public slots:
    void read();
};

#endif // CONNECTIONHANDLER_H
