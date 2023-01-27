import QtQuick 2.4
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0
import FishUI 1.0 as FishUI

Item {
    implicitWidth: 150

    property int itemRadiusV: 8

    property alias view: listView
    property alias model: listModel
    property alias currentIndex: listView.currentIndex

    ListModel {
        id: listModel

        ListElement {
            title: qsTr("Home")
            page: "store/#/flamescion/?"
            iconSource: "qrc:/icons/sidebar/leftbutton_0.svg"
        }
        ListElement {
            title: qsTr("Network")
            page: "store/#/flamescion/applist?type=network"
            iconSource: "qrc:/icons/sidebar/leftbutton_1.svg"
        }
        ListElement {
            title: qsTr("Chat")
            page: "store/#/flamescion/applist?type=chat"
            iconSource: "qrc:/icons/sidebar/leftbutton_2.svg"
        }
        ListElement {
            title: qsTr("Music")
            page: "store/#/flamescion/applist?type=music"
            iconSource: "qrc:/icons/sidebar/leftbutton_3.svg"
        }
        ListElement {
            title: qsTr("Video")
            page: "store/#/flamescion/applist?type=video"
            iconSource: "qrc:/icons/sidebar/leftbutton_4.svg"
        }
        ListElement {
            title: qsTr("Image Graphics")
            page: "store/#/flamescion/applist?type=image_graphics"
            iconSource: "qrc:/icons/sidebar/leftbutton_5.svg"
        }
        ListElement {
            title: qsTr("Games")
            page: "store/#/flamescion/applist?type=games"
            iconSource: "qrc:/icons/sidebar/leftbutton_6.svg"
        }
        ListElement {
            title: qsTr("Office")
            page: "store/#/flamescion/applist?type=office"
            iconSource: "qrc:/icons/sidebar/leftbutton_7.svg"
        }
        ListElement {
            title: qsTr("Reading")
            page: "store/#/flamescion/applist?type=reading"
            iconSource: "qrc:/icons/sidebar/leftbutton_8.svg"
        }
        ListElement {
            title: qsTr("Development")
            page: "store/#/flamescion/applist?type=development"
            iconSource: "qrc:/icons/sidebar/leftbutton_9.svg"
        }
        ListElement {
            title: qsTr("Tools")
            page: "store/#/flamescion/applist?type=tools"
            iconSource: "qrc:/icons/sidebar/leftbutton_10.svg"
        }
        ListElement {
            title: qsTr("Themes")
            page: "store/#/flamescion/applist?type=themes"
            iconSource: "qrc:/icons/sidebar/leftbutton_11.svg"
        }
        ListElement {
            title: qsTr("Others")
            page: "store/#/flamescion/applist?type=others"
            iconSource: "qrc:/icons/sidebar/leftbutton_12.svg"
        }
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 0
        spacing: 0

        Label {
            text: rootWindow.title
            color: rootWindow.active ? FishUI.Theme.textColor : FishUI.Theme.disabledTextColor
            Layout.preferredHeight: rootWindow.header.height
            leftPadding: FishUI.Units.largeSpacing + FishUI.Units.smallSpacing
            rightPadding: FishUI.Units.largeSpacing + FishUI.Units.smallSpacing
            topPadding: FishUI.Units.smallSpacing
            bottomPadding: 0
            font.pointSize: 13
        }

        ListView {
            id: listView
            Layout.fillHeight: true
            Layout.fillWidth: true
            clip: true
            model: listModel

            spacing: FishUI.Units.smallSpacing
            leftMargin: FishUI.Units.largeSpacing
            rightMargin: FishUI.Units.largeSpacing
            topMargin: FishUI.Units.largeSpacing
            bottomMargin: FishUI.Units.largeSpacing

            ScrollBar.vertical: ScrollBar {}

            highlightFollowsCurrentItem: true
            highlightMoveDuration: 0
            highlightResizeDuration : 0
            highlight: Rectangle {
                radius: FishUI.Theme.mediumRadius
                color: Qt.rgba(FishUI.Theme.textColor.r,
                               FishUI.Theme.textColor.g,
                               FishUI.Theme.textColor.b, 0.05)
                smooth: true
            }

            FishUI.WheelHandler {
                target: listView
            }

            delegate: Item {
                id: item
                width: ListView.view.width - ListView.view.leftMargin - ListView.view.rightMargin
                height: 35

                property bool isCurrent: listView.currentIndex === index

                Rectangle {
                    anchors.fill: parent

                    MouseArea {
                        id: mouseArea
                        anchors.fill: parent
                        hoverEnabled: true
                        acceptedButtons: Qt.LeftButton
                        onClicked: listView.currentIndex = index
                    }

                    radius: FishUI.Theme.mediumRadius
                    color: mouseArea.pressed ? Qt.rgba(FishUI.Theme.textColor.r,
                                                       FishUI.Theme.textColor.g,
                                                       FishUI.Theme.textColor.b, FishUI.Theme.darkMode ? 0.05 : 0.1) :
                           mouseArea.containsMouse || isCurrent ? Qt.rgba(FishUI.Theme.textColor.r,
                                                                          FishUI.Theme.textColor.g,
                                                                          FishUI.Theme.textColor.b, FishUI.Theme.darkMode ? 0.1 : 0.05) :
                                                                  "transparent"

                    smooth: true
                }

                RowLayout {
                    anchors.fill: parent
                    anchors.leftMargin: FishUI.Units.smallSpacing
                    spacing: FishUI.Units.smallSpacing

                    Rectangle {
                        id: iconRect
                        width: 24
                        height: 24
                        Layout.alignment: Qt.AlignVCenter
                        radius: 6
                        color: "transparent"
                        Image {
                            id: icon
                            anchors.centerIn: parent
                            width: 16
                            height: width
                            source: model.iconSource
                            sourceSize: Qt.size(width, height)
                            Layout.alignment: Qt.AlignVCenter
                            antialiasing: false
                            smooth: false
                            layer.enabled: true
                            layer.effect: ColorOverlay {
                                color: FishUI.Theme.textColor
                            }
                        }
                    }

                    Label {
                        id: itemTitle
                        text: model.title
                        color: FishUI.Theme.darkMode ? FishUI.Theme.textColor : "#363636"
                        font.pointSize: 8
                    }

                    Item {
                        Layout.fillWidth: true
                    }
                }
            }
        }
    }
}
