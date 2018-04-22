//
//  ViewController.swift
//  HW1_KMH
//
//  Created by SWUCOMPUTER on 2018. 4. 14..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    //Outlet 선언
    @IBOutlet var numOfMember: UIPickerView!
    var mem: Int!
    
    //PickerView에서 쓰일 배열
    let memberArray:[String] = ["2명","3명","4명"]
    //pickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return memberArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return memberArray[row]
    }
    
    //PickerView에서 고른 인원수(mem)를 segue를 통해서 넘겨주기
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let member: String = memberArray[self.numOfMember.selectedRow(inComponent: 0)]
        if(member == "2명"){
            mem = 2
        }else if(member == "3명"){
            mem = 3
        }else if(member == "4명"){
            mem = 4
        }
        
        if segue.identifier == "toWriteNameView" {
            let destVC = segue.destination as! WriteNameView
            
            if(mem == 2){
                destVC.mem = 2
            }else if(mem == 3){
                destVC.mem = 3
            }else if(mem == 4){
                destVC.mem = 4
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

