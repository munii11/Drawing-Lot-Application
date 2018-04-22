//
//  WriteNameView.swift
//  HW1_KMH
//
//  Created by SWUCOMPUTER on 2018. 4. 19..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class WriteNameView: UIViewController, UITextViewDelegate {

    @IBOutlet var playerOne: UITextField!
    @IBOutlet var playerTwo: UITextField!
    @IBOutlet var playerThree: UITextField!
    @IBOutlet var playerFour: UITextField!
    @IBOutlet var playerOneLabel: UILabel!
    @IBOutlet var playerTwoLabel: UILabel!
    @IBOutlet var playerThreeLabel: UILabel!
    @IBOutlet var playerFourLabel: UILabel!
    var mem: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let contentNum = mem {
            mem = contentNum
        }
        //인원수가 2명이면 플레이어3, 4 라벨과 텍스트필드 숨기기
        //인원수가 3면이면 플레이어4 라멜과 텍스트필드 숨기기
        if( mem == 2 ) {
            playerThreeLabel.isHidden = true
            playerThree.isHidden = true
            playerFourLabel.isHidden = true
            playerFour.isHidden = true
        }
        else if( mem == 3){
            playerFour.isHidden = true
            playerFourLabel.isHidden = true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDrawingLotView" {
            let destVC = segue.destination as! DrawingLotView
            
            //플레이어 수와 이름 넘겨주기
            destVC.nameOne = playerOne.text
            destVC.nameTwo = playerTwo.text
            if(mem==2) {
                destVC.mem = 2
            }
            if(mem == 3){
                destVC.nameThree = playerThree.text
                destVC.mem = 3
            }
            if(mem == 4) {
                destVC.nameThree = playerThree.text
                destVC.nameFour = playerFour.text
                destVC.mem = 4
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
