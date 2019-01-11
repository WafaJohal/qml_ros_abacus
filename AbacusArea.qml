import QtQuick 2.0
import Box2D 2.0
import './shared/'

Rectangle {
    id:abacusArea
    anchors.fill: parent
    property int nbRows: 3
    property var listColors: ['red','green','blue']





    // BOX2D WORLD
    World {
        id: physicsWorld
        gravity: Qt.point(0.0, 0.0);

    }

    WindowBoundaries {}


    Repeater{
        model: nbRows
        AbacusRow{
            id: this_row
            row_nb: index
            color: 'transparent'
            x: 10
            y: this_row.height *index
            width: abacusArea.width - 20
            height: abacusArea.height/(nbRows+1)

        }


    }



}