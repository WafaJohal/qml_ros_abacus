#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <ros/ros.h>

int main(int argc, char *argv[])
{
     ros::init(argc, argv,"abacus");

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
