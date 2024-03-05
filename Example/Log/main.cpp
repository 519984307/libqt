#include <QCoreApplication>

#include "log4qt/logger.h"
#include "log4qt/logmanager.h"
#include "log4qt/propertyconfigurator.h"

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    Log4Qt::Logger *log = Log4Qt::Logger::logger("log");
    log->debug("debug");

    return a.exec();
}
