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

             delegate: Item {
                         height: 32
                         width: 32
                         Image {
                             mipmap: true
                             source: styleData.value
                             width: 32
                             height: 32
                             anchors.centerIn: parent
                         }
                     }
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

         model: ListModel {
               ListElement {
                   icon: "qrc:/checkmark.png"
                   date: "20.10.2016, 13:37"
                   message:"fnjdlanhglvwrng"
               }
               ListElement {
                   icon: ""
                   date: "18.10.2016, 08:46"
                   message:"dfnsaporqq"
               }
               ListElement {
                   icon: ""
                   date: "18.10.2016, 09:33"
                   message:"fnjdlanhglvwrng"
               }
               ListElement {
                   icon: ""
                   date: "18.10.2016, 09:53"
                   message:"dfnsaporqq"
               }
           }
     }
}
