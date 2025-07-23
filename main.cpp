#include <QApplication>
#include <QWebEngineView>
#include <QWebEngineSettings>

int main(int argc, char *argv[]) {
    QApplication app(argc, argv);

    QWebEngineView view;
    view.settings()->setAttribute(QWebEngineSettings::PluginsEnabled, true);
    view.settings()->setAttribute(QWebEngineSettings::FullScreenSupportEnabled, true);
    view.load(QUrl::fromLocalFile(QStringLiteral("/app/index.html")));
    view.showFullScreen();

    return app.exec();
}