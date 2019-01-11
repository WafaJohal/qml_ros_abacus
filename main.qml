import QtQuick 2.11
import QtQuick.Window 2.11
import "./shared"


import Box2D 2.0

Window {
    id:window
    visible: true
    width: Screen.width
    height: Screen.height
    title: qsTr("Hello World")

    AbacusArea{
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        anchors.bottomMargin: 10
        anchors.topMargin: 10
        anchors.fill: parent
    }

}
