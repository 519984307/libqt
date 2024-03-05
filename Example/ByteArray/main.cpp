#include <QCoreApplication>

#include <QDebug>
#include <QByteArray>

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    QByteArray arr{};
    arr.append(quint8(1));
    arr.append(quint8(2));
    arr.append(quint8(3));
    arr.append(quint8(4));
    arr.append(quint8(5));

    QByteArray ret = arr.left(2);
    arr = arr.mid(2);
    qDebug() << ret;
    qDebug() << arr;

    return a.exec();
}
