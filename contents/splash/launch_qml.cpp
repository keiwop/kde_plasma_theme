#include 	<QApplication>
#include 	<QtQml/QQmlApplicationEngine>
#include 	<QFile>
#include 	<iostream>
// #include 	<units.h>

int main(int argc, char **argv){
	QApplication app(argc, argv);
	QQmlApplicationEngine engine;
	QString path;
	
	if(argc == 2)
		path = app.applicationDirPath() + "/" + argv[1];
	else
		path = app.applicationDirPath() + "/Splash.qml";
	
	std::cout << "Path: " << path.toStdString() << "\n";
	
	if(QFile::exists(path))
		engine.load(path);
	else
		return 1;
	
	return app.exec();
}
