import QtQuick 2.0
import QtQuick.Controls 1.4

Item {
     id: eventTableView
     property alias model: tableView.model

     TableView{
         id:tableView
         anchors.fill: parent
         selectionMode: SelectionMode.NoSelection
     }
}
