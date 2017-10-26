#include <QCoreApplication>
#include "ampelserver.h"

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    AmpelServer *s = new AmpelServer();

    return a.exec();
}
