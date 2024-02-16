//
//  ViewController.swift
//  дз tic tac teo
//
//  Created by Азамат Булегенов on 07.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    
    var buttonTag = 0
    var counter = 0
    var image = ["q1","q2","q3","q4","q5","q6","q7","q8","q1","q2","q3","q4","q5","q6","q7","q8"]
    //    var image2 = []
    var isOpen = false
    var isTimer = false
    
    func resetTag(){
        for i in 1...16 {
            let button = view.viewWithTag(i) as! UIButton
            button.setBackgroundImage(nil, for: .normal)
        }
    }
    
    func resAlert() {
        let alert = UIAlertController(title: "Gобеда", message: "заново", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.resetTag()}))
        counter = 0
        image.shuffle()
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func game(_ sender: UIButton) {
        print(sender.tag)
        
        if isTimer == true {
            return
        }
        
//        if sender.setBackgroundImage(for: .normal) != nil {
//            return
//        }
        
        
        sender.setBackgroundImage(UIImage(named: image[sender.tag - 1]), for: .normal)
        
        
        if isOpen == true {
            
            if image[sender.tag - 1 ] == image[buttonTag - 1] {
                counter += 1
                print("counter \(counter)")
            } else {
                isTimer = true
                Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
                    sender.setBackgroundImage(nil, for: .normal)
                    let tagButton = self.view.viewWithTag(self.buttonTag) as! UIButton
                    tagButton.setBackgroundImage(nil, for: .normal)
                    self.isTimer = false
                }
            }
            
        } else {
            buttonTag = sender.tag
//            print(buttonTag)
        }
        isOpen.toggle()
        if counter == 8 {
            resAlert()
        }
    }
    
   
}
