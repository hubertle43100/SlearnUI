//
//  InterfaceController.swift
//  HuliPizzaWatch WatchKit Extension
//
//  Created by Hubert Le on 9/22/21.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    let menu = MenuModel.menu

    @IBOutlet weak var selectedItemLabel: WKInterfaceLabel!
    @IBOutlet weak var table: WKInterfaceTable!
    
    
    @IBOutlet weak var clearSelection: WKInterfaceButton!
    @IBAction func doClearSelection() {
        selectedItemLabel.setText("Menu")
        SelectedItem.current.selected = nil
    }

    func loadTable() {
        table.setNumberOfRows(menu.count, withRowType: "row")
        for index in 0..<menu.count {
            let row = self.table.rowController(at: index) as! RowController
            row.label.setText(menu[index].name)
            row.image.setImageNamed("\(menu[index].id)_100w")
        }
    }
    
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
        loadTable()
        selectedItemLabel.setText("Awake!")
        clearSelection.setBackgroundColor(.red)
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        pushController(withName: "DetailController", context: menu[rowIndex])
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        selectedItemLabel.setText(SelectedItem.current.selected?.name ?? "Menu")
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }

}

class RowController: NSObject {
    @IBOutlet weak var image: WKInterfaceImage!
    @IBOutlet weak var label: WKInterfaceLabel!
}




