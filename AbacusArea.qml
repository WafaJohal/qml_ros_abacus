import QtQuick 2.0
import Box2D 2.0
import './shared/'

Rectangle {
    id:abacusArea
    anchors.fill: parent
    property int nbRows: 3





    Repeater{
        model: nbRows

        Row{
            id:rectangleBox
            width: abacusArea.width - 20
            height: abacusArea.height/(nbRows+1)

            AbacusRow{
                id: this_row
                row_nb: index
                color: 'transparent'
                x: 10
                y: this_row.height *index
                height: abacusArea.height/(nbRows+1)
                width: abacusArea.width - 20 - height

            }

            Rectangle {
                y:this_row.height *index
                width: rectangleBox.height
                height: rectangleBox.height
                border.width : 5
                border.color : "lightgrey"
                color: 'transparent'
                Text {
                    anchors.centerIn: parent
                    font.pointSize: 30
                    text: this_row.rowCounter
                    color: "grey"
                }

            }



        }


    }



}
