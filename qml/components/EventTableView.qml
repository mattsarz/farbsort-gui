import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Item {
     id: eventTableView
     property alias model: tableView.model

     TableView{
         id:tableView
         anchors.fill: parent
         selectionMode: SelectionMode.NoSelection

         style: TableViewStyle {
                 frame: Rectangle {
                            border.width: 0
                        }
             }

         headerDelegate:Rectangle{
            color: "transparent"
            height:0
         }

         model: ListModel {
               ListElement {
                   icon: "value 1"
                   date: "value 2"
                   message:"fnjdlanhglvwrng"
               }
               ListElement {
                   icon: "value 1"
                   date: "28.11.1972"
                   message:"dfnsaporqq"
               }
           }

         rowDelegate: Rectangle{
             width: childrenRect.width
             height: tableView.height/4
             Rectangle{
                  anchors.bottom: parent.bottom
                  height: 1
                  color: "lightgray"
                  width: childrenRect.width
              }
         }

         TableViewColumn {
             id: markColumn
             role: "icon"
             movable: false
             resizable: false
             width: tableView.viewport.width - dateColumn.width - msgColumn.width
         }

         TableViewColumn {
             id: dateColumn
             role: "date"
             movable: false
             resizable: false
             width: tableView.viewport.width / 3
         }

         TableViewColumn {
             id: msgColumn
             role: "message"
             movable: false
             resizable: false
             width: tableView.viewport.width / 2
         }
     }
}
