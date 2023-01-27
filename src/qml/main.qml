import QtQuick 2.4
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Window 2.3
import QtGraphicalEffects 1.0
import FishUI 1.0 as FishUI

FishUI.Window {
    id: rootWindow
    title: qsTr("Spark Store")
    visible: true
    width: 900
    height: 610

    minimumWidth: 900
    minimumHeight: 600

    GlobalSettings { id: settings }
    property alias stackView: _stackView
    property string serverUrl: settings.serverUrl
    property string nowWebUrl: "store/#/flamescion/"

    background.opacity: FishUI.Theme.darkMode ? 0.8 : 0.6
    header.height: 36 + FishUI.Units.largeSpacing
    contentTopMargin: 0

    LayoutMirroring.enabled: Qt.application.layoutDirection === Qt.RightToLeft
    LayoutMirroring.childrenInherit: true

    FishUI.WindowBlur {
        view: rootWindow
        geometry: Qt.rect(rootWindow.x, rootWindow.y, rootWindow.width, rootWindow.height)
        windowRadius: rootWindow.windowRadius
        enabled: true
    }

    headerItem: Item {
        RowLayout {
            anchors.fill: parent
            anchors.leftMargin: FishUI.Units.smallSpacing * 1.5
            anchors.rightMargin: FishUI.Units.smallSpacing * 1.5
            anchors.topMargin: FishUI.Units.smallSpacing * 1.5
            anchors.bottomMargin: FishUI.Units.smallSpacing * 1.5

            spacing: FishUI.Units.smallSpacing

            TopBar {
                id: _topBar
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
        }
    }

    RowLayout {
        anchors.fill: parent
        spacing: 0

        SideBar {
            id: sideBar
            Layout.fillHeight: true

            onCurrentIndexChanged: {
                switchPageFromIndex(currentIndex)
            }
        }

        StackView {
            id: _stackView
            Layout.fillWidth: true
            Layout.fillHeight: true
            initialItem: "qrc:/Pages/WebListPage.qml"
            clip: true

            pushEnter: Transition {}
            pushExit: Transition {}
        }
    }

    function switchPageFromIndex(index) {
        _stackView.pop()
        _stackView.push("qrc:/Pages/WebListPage.qml")
        nowWebUrl = sideBar.model.get(index).page
    }
}
