import QtQuick 2.0
import Box2D 2.0

//import Ros 1.0





Rectangle {
    id:bead
    visible: true
    radius: 180
    property int my_row // line row on which the bead is place with 0 being the first row
    property int order: 0 // order of the bead on its line from left to right, 0 being left
    property var listColors: ['red','green','blue']

    objectName: "bead_"+my_row.index+ "_"+order

    property string name

    gradient: Gradient {
        GradientStop { position: 0.0; color: listColors[my_row] }
        GradientStop { position: 1.0; color: "yellow" }
    }

    property Body body: Body {
        target: bead
        world: physicsWorld

        fixedRotation: false
        sleepingAllowed: false
        bodyType: Body.Dynamic

        Circle {
            radius: width / 2
            density: 1
            friction: 1
            restitution: 0.3
        }
    }

    MouseArea {
        //***** MouseArea basic definitions
        id: mouseArea2
        anchors.fill: bead
        drag.target: bead
        drag.axis: Drag.XAxis

        onPressed:
            bead.border.color ='black'
        onReleased:
            bead.border.color ='transparent'



    }

}

