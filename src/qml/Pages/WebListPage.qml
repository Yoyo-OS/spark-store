import QtQuick 2.4
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0
import QtWebEngine 1.10
import FishUI 1.0 as FishUI
Item{
    property string theme: FishUI.Theme.darkMode? "dark":"light"
    Rectangle {
        id: _background
        anchors.fill: parent
        anchors.rightMargin: 1
        anchors.topMargin: rootWindow.header.height
        radius: FishUI.Theme.mediumRadius
        color: FishUI.Theme.secondBackgroundColor

        WebEngineView {
            id: webView
            anchors.fill: parent
            anchors.leftMargin: FishUI.Units.smallSpacing
            anchors.topMargin: FishUI.Units.smallSpacing
            url: rootWindow.serverUrl + rootWindow.nowWebUrl + "&theme=" + theme
        }
    }
}
