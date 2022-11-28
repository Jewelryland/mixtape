//
//  ViewController_FinishedEntry.swift
//  MusicApp
//
//  Created by Scholar on 8/17/22.
//

import UIKit

class ViewController_FinishedEntry: UIViewController {
    @IBOutlet weak var dateTitle: UILabel!
    @IBOutlet weak var moodToday: UILabel!
    @IBOutlet weak var listening: UILabel!
    @IBOutlet weak var noteText: UILabel!
    
    var itemStore: ItemStore!
//    struct Item: Codable{
  //      var listening: String
 //       var moodToday: String?
  //      let dateTitle: Date
  //      var noteText: String?
   // }
        
        
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        print("Called buttonTapped(_:)")
        
        let itemStore = ItemStore()
        let newItem = itemStore.createItem()
        newItem.listening = listening.text!
        newItem.moodToday = moodToday.text
        newItem.dateTitle = dateTitle.text
        newItem.noteText = noteText.text
        var content = itemStore.saveChanges()    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        dateTitle.text = answers.date
        moodToday.text = answers.mood
        listening.text = "\(answers.song) by \(answers.artist)"
        noteText.text = answers.noteEntry
        
        //store data into item
        //   var itemStore: ItemStore!
        
    }
    //save answer values into item before screen disappear
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(true)
        
       // let itemStore = ItemStore()
       // let newItem = itemStore.createItem()
       // newItem.listening = listening.text!
      //  newItem.moodToday = moodToday.text
       // newItem.dateTitle = dateTitle.text
       // newItem.noteText = noteText.text
       // var content = itemStore.saveChanges()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
