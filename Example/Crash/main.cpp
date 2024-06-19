#include <QCoreApplication>

#include "QBreakpadHandler.h"

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    QBreakpadInstance.setDumpPath("./");

    int *i = nullptr;
    *i = 1;

    return a.exec();
}
