//
//  DrawingLotView.swift
//  HW1_KMH
//
//  Created by SWUCOMPUTER on 2018. 4. 19..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class DrawingLotView: UIViewController {

    //버튼이미지
    let losePaperImage = UIImage(named: "losePaper.PNG") as UIImage!
    let passPaperImage = UIImage(named: "passPaper.PNG") as UIImage!
    //이름을 적기 위한 라벨
    //플레이어 3-1은 3명일때 배치를 보기 좋기 하기 위해서 사용
    @IBOutlet var playerOneLabel: UILabel!
    @IBOutlet var playerTwoLabel: UILabel!
    @IBOutlet var playerThreeLabel: UILabel!
    @IBOutlet var playerFourLabel: UILabel!
    @IBOutlet var playerThreeLabel_1: UILabel!
    //쪽지 버튼
    @IBOutlet var playerOneBtn: UIButton!
    @IBOutlet var playerTwoBtn: UIButton!
    @IBOutlet var playerThreeBtn: UIButton!
    @IBOutlet var playerFourBtn: UIButton!
    @IBOutlet var playerThreeBtn_1: UIButton!
    //WriteName에서 사용자 수와 이름을 받기 위한 변수들
    var nameOne: String?
    var nameTwo: String?
    var nameThree: String?
    var nameFour: String?
    var mem: Int?
    //랜덤수를 넣어줄 배열
    //배열에 랜덤한 수를 넣어주고, 숫자 0이 들어있는 인덱스가 꽝이 됨
    var selectLoseArray = Array<Int>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let contentNum = mem {
            mem = contentNum
        } //사용자 수 받아오기
        
        if(mem==2){
            //사용자가 2명이라면 플레이어 3,3-1,4의 이름과 쪽지를 안보이게 설정
            playerThreeLabel.isHidden = true
            playerThreeBtn.isHidden = true
            playerFourLabel.isHidden = true
            playerFourBtn.isHidden = true
            playerThreeBtn_1.isHidden = true
            playerThreeLabel_1.isHidden = true
            
            //배열 0,1 인덱스에 반복되지 않는 랜덤한 수 넣기
            for _ in 0 ... 1 {
                selectLoseArray.append(Int(arc4random_uniform(2)))
                selectLoseArray.append(Int(arc4random_uniform(2)))
                
                while selectLoseArray[0] == selectLoseArray[1] {
                    selectLoseArray.remove(at: 1)
                    selectLoseArray.append(Int(arc4random_uniform(2)))
                }
            }
        }
        else if(mem == 3){
            //사용자가 3명이라면 플레이어 3,4의 이름과 쪽지를 안보이게 설정
            playerFourLabel.isHidden = true
            playerFourBtn.isHidden = true
            playerThreeBtn.isHidden = true
            playerThreeLabel.isHidden = true
            
            //배열 0,1,2 인덱스에 반복되지 않는 랜덤한 수 넣기
            for _ in 0 ... 2 {
                selectLoseArray.append(Int(arc4random_uniform(3)))
                selectLoseArray.append(Int(arc4random_uniform(3)))
                selectLoseArray.append(Int(arc4random_uniform(3)))
                
                while ((selectLoseArray[0] == selectLoseArray[1]) || (selectLoseArray[0] == selectLoseArray[2]) || (selectLoseArray[1] == selectLoseArray[2])) {
                    selectLoseArray.remove(at: 1)
                    selectLoseArray.append(Int(arc4random_uniform(3)))
                    selectLoseArray.remove(at: 2)
                    selectLoseArray.append(Int(arc4random_uniform(3)))
                }
            }
        }
        else if( mem==4 ){
            //사용자가 4명이라면 플레이어 3-1의 이름과 쪽지를 안보이게 설정
            playerThreeBtn_1.isHidden = true
            playerThreeLabel_1.isHidden = true
            
            //배열 0,1,2 인덱스에 반복되지 않는 랜덤한 수 넣기
            for _ in 0 ... 3 {
                selectLoseArray.append(Int(arc4random_uniform(4)))
                selectLoseArray.append(Int(arc4random_uniform(4)))
                selectLoseArray.append(Int(arc4random_uniform(4)))
                selectLoseArray.append(Int(arc4random_uniform(4)))
                
                while ((selectLoseArray[0] == selectLoseArray[1]) || (selectLoseArray[0] == selectLoseArray[2]) || (selectLoseArray[0] == selectLoseArray[3]) || (selectLoseArray[1] == selectLoseArray[2]) || (selectLoseArray[1] == selectLoseArray[3]) || (selectLoseArray[2] == selectLoseArray[3])) {
                    selectLoseArray.remove(at: 1)
                    selectLoseArray.append(Int(arc4random_uniform(4)))
                    selectLoseArray.remove(at: 2)
                    selectLoseArray.append(Int(arc4random_uniform(4)))
                    selectLoseArray.remove(at: 3)
                    selectLoseArray.append(Int(arc4random_uniform(4)))
                }
            }
        }
        
        //Label에 사용자 이름넣기
        if let contentString1 = nameOne {
            playerOneLabel.text = contentString1
        }
        if let contentString2 = nameTwo {
            playerTwoLabel.text = contentString2
        }
        if let contentString3 = nameThree{
            playerThreeLabel.text = contentString3
        }
        if let contentString3_1 = nameThree{
            playerThreeLabel_1.text = contentString3_1
        }
        if let contentString4 = nameFour {
            playerFourLabel.text = contentString4
        }
    }

    //selectLoseArray[index] 가 영이면 index사용자가 꽝
    //꽝인 사용자 버튼을 눌렀을 때 losePaperImage가 뜨도록 설정
    //패스라면 passPaperImage가 뜨도록 설정
    @IBAction func playerBtnOne(_ sender: UIButton) {
        if( selectLoseArray[0] == 0 ){
            playerOneBtn.setImage(losePaperImage, for: UIControlState.normal)
        }
        else { playerOneBtn.setImage(passPaperImage, for: UIControlState.normal)}
    }
    @IBAction func playerBtnTwo(_ sender: UIButton) {
        if( selectLoseArray[1] == 0 ){
            playerTwoBtn.setImage(losePaperImage, for: UIControlState.normal)
        }else { playerTwoBtn.setImage(passPaperImage, for: UIControlState.normal)}
    }
    @IBAction func playerBtnThree(_ sender: UIButton) {
        if( selectLoseArray[2] == 0 ){
            playerThreeBtn.setImage(losePaperImage, for: UIControlState.normal)
        } else{ playerThreeBtn.setImage(passPaperImage, for: UIControlState.normal)}
    }
    @IBAction func playerBtnThree_1(_ sender: UIButton) {
        if( selectLoseArray[2] == 0 ){
            playerThreeBtn_1.setImage(losePaperImage, for: UIControlState.normal)
        } else{ playerThreeBtn_1.setImage(passPaperImage, for: UIControlState.normal)}
    }
    @IBAction func playerBtnFour(_ sender: UIButton) {
        if( selectLoseArray[3] == 0 ){
            playerFourBtn.setImage(losePaperImage, for: UIControlState.normal)
        } else { playerFourBtn.setImage(passPaperImage, for: UIControlState.normal)}
    }
 
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
