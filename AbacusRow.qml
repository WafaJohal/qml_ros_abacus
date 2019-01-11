import QtQuick 2.0
import Box2D 2.0
import './shared/'

Rectangle {
    id:root
    property int row_nb: 0 // index of this row
    property int nbBeads: 10
    property int width_empty: 30 // defines the size of the empty space in a row
    property int rowCounter :0
    property Body pressedBody: null


    function updateRowCounter(){
        //TODO
        rowCounter = 0;
    }

    Rectangle{
    width: parent.width
    height: 3*parent.height/100
    color: 'gray'
    anchors.verticalCenter: parent.verticalCenter

    }

    // BOX2D WORLD
    World {
        id: physicsWorld
        gravity: Qt.point(0.0, 0.0);
        enableContactEvents: true

    }

    WindowBoundaries {}

    MouseJoint {
        id: mouseJoint
        bodyA: anchor
        dampingRatio: 0.8
        maxForce: 100

    }



    MouseArea {
        id: mouseArea
        anchors.fill: parent

        onPressed: {
            if (pressedBody != null) {
                mouseJoint.maxForce = pressedBody.getMass() * 500;
                mouseJoint.target = Qt.point(mouseX, mouseY);
                mouseJoint.bodyB = pressedBody;
            }
        }

        onPositionChanged: {
            mouseJoint.target = Qt.point(mouseX, mouseY);
        }

        onReleased: {
            mouseJoint.bodyB = null;
            pressedBody = null;
        }
    }

    Body {
        id: anchor
        world: physicsWorld
    }



    Repeater{
        id:beadRepeater
        model:nbBeads
        Bead {
            id:bead
            x: root.x+ width /2  + width *index
            anchors.verticalCenter: root.verticalCenter
            rotation: 0
            width: root.width/nbBeads - width_empty
            height: width
            order: index
            my_row: root.row_nb
            onPressedBead: pressedBody = bead.body
            onXChanged:
                root.updateRowCounter()
            //physicsWorld: physicsWorld
        }


    }


}
