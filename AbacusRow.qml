import QtQuick 2.0
import Box2D 2.0
import './shared/'

Rectangle {
    id:root
    property int row_nb: 0 // index of this row
    property int nbBeads: 10
    property int width_empty: 30 // defines the size of the empty space in a row

    Repeater{
        model:nbBeads
        Bead {
            x: root.x+ width /2  + width *index
            anchors.verticalCenter: root.verticalCenter
            rotation: 0
            width: root.width/nbBeads - width_empty
            height: width
            order: index
            my_row: root.row_nb
        }

    }
}
