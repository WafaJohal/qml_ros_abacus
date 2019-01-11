import QtQuick 2.0
import Box2D 2.0

import './shared/'
import Ros 1.0





Rectangle {
    id:bead
    visible: true
    radius: 180
    property int my_row // line row on which the bead is place with 0 being the first row
    property int order: 0 // order of the bead on its line from left to right, 0 being left
    property var listColors: ['red','green','blue']
    property Body body: body

    signal pressedBead(var bead)

    //onXChanged:
     //   bead_xChangePublisher.text = ''+x

//    RosStringPublisher {
//        id: bead_xChangePublisher
//        topic: "abacus/row"+my_row+"/bead"+order+"/xchange"
//    }

    RosStringSubscriber {
        id: bead_xChangeSubscriber
        topic: "abacus/row"+my_row+"/bead"+order+"/setX"
        onTextChanged:
            bead.x = parseInt(text)
    }


    objectName: "bead_"+my_row.index+ "_"+order

    property string name

    function randomColor(row_index) {
        if(row_index ===  0)
            return Qt.rgba(1, 0.2, 0.2, 1);
        else if(row_index ===  1)
            return Qt.rgba(0.2 ,1 , 0.2, 1);
        else
            return Qt.rgba(0.2, 0.2, 1, 1);
    }


    gradient: Gradient {
        GradientStop { position: 0.0; color: randomColor(my_row) }
        GradientStop { position: 0.7; color: randomColor(my_row) }
        GradientStop { position: 1.0; color: "gray" }
    }

    RosStringPublisher{
        id:collisionPub

    }

    CircleBody {
        id:body
        target: bead
        world: physicsWorld

        fixedRotation: true
        sleepingAllowed: false


        bodyType: Body.Static

        radius: width / 2
        density: 1
        friction: 1
        restitution: 0


    }

    MouseArea {
        anchors.fill: bead
        propagateComposedEvents: true
        onPressed: {
            mouse.accepted = false;
            pressedBead(bead);
            body.bodyType = Body.Dynamic
        }
        onReleased: {
            body.bodyType = Body.Static
            mouse.accepted = true;


        }
    }
}

