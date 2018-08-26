//
//  ViewController.swift
//  SliderShowApp
//
//  Created by yuito miyamoto on 2018/08/25.
//  Copyright © 2018年 yuito miyamoto. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    //画像表示先
    @IBOutlet weak var image: UIImageView!
    
    //３枚の写真の変数を設定
    let userPictures1 = UIImage(named: "userPic1")!
    let userPictures2 = UIImage(named: "userPic2")!
    let userPictures3 = UIImage(named: "userPic3")!
    
    //写真番号を宣言
    var PicturesNumber = 0
    
    //配列で宣言
    let imageNameArray = ["userPic1", "userPic2", "userPic3"]
    
    //タイマー型宣言
    var timer: Timer!
    
    //再生ボタン
    @IBOutlet weak var button: UIButton!
    //進むボタン
    @IBOutlet weak var goingNext: UIButton!
    //戻るボタン
    @IBOutlet weak var goingBack: UIButton!
    
    //再生ボタン押す
    @IBAction func Start(_ sender: Any) {
        if self.timer == nil{
            //ボタン名を「停止」に変更
            button.setTitle("停止", for: .normal)
            
            //ボタンを押せないようにする
            goingNext.isEnabled = false // 「進む」ボタン無効
            goingBack.isEnabled = false // 「戻る」ボタン無効
            
            //タイマー起動
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)),userInfo: nil, repeats: true)
        }else if self.timer != nil{
            //変数timerがnilではないときボタン名を変更
            button.setTitle("再生", for: .normal)
            goingNext.isEnabled = true// 「進む」ボタン有効
            goingBack.isEnabled = true//「戻る」ボタン有効
            //一時停止
            self.timer.invalidate()
            self.timer = nil
        }
    }
    
    //ボタンタップ後、2秒毎に画像を変更する（写真番号をに1プラスして、配列から取得）
    @objc func updateTimer(_ timer: Timer){

        if PicturesNumber < 2 {
            PicturesNumber += 1
        }else if PicturesNumber == 2{
            PicturesNumber = 0
        }
        
        //配列から取得
        let slidePic1 = imageNameArray[PicturesNumber]
        let slidePic2 = UIImage(named:slidePic1)
        //PicturesNumberの画像を表示
        self.image.image = slidePic2
    }
    
    //「進むボタン」タップ後
    @IBAction func GoingNext(_ sender: Any){
        //次の画像を表示（1枚目なら2枚目、2枚目なら3枚目、3枚目なら１枚目）
        
        if PicturesNumber < 2 {
            PicturesNumber += 1
        }else if PicturesNumber == 2{
            PicturesNumber = 0
        }
        //配列から取得
        let slidePic1 = imageNameArray[PicturesNumber]
        let slidePic2 = UIImage(named:slidePic1)
        //PicturesNumberの画像を表示
        self.image.image = slidePic2
    }
    
    
    //「戻るボタン」タップ後
    @IBAction func GoingBack(_ sender: Any) {
        //前の画像を表示（1枚目なら3枚目、2枚目なら１枚目、3枚目なら2枚目）
        if PicturesNumber > 0 {
            PicturesNumber -= 1
        }else if PicturesNumber == 0{
            PicturesNumber = 2
        }
        //配列から取得
        let slidePic1 = imageNameArray[PicturesNumber]
        let slidePic2 = UIImage(named:slidePic1)
        //PicturesNumberの画像を表示
        self.image.image = slidePic2
        
    }
    
    //画像タップ後、次のページへ
    @IBAction func onTapImage(_ sender: Any) {
        if timer != nil{
            timer.invalidate()
            button.setTitle("再生", for: .normal)
            self.timer = nil
            goingNext.isEnabled = true // 「進む」ボタン有効
            goingBack.isEnabled = true // 「戻る」ボタン有効
        }
        performSegue(withIdentifier: "SecondPage", sender: nil)
    }
    
    //画像データの引き渡し
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        //SecondViewControllerを取得
        let secondViewController:SecondViewController = segue.destination as! SecondViewController
        if self.image.image == self.userPictures1{secondViewController.expandingPicName = userPictures1
            
        }else if self.image.image == self.userPictures2{secondViewController.expandingPicName = userPictures2
            
        }else if self.image.image == self.userPictures3{secondViewController.expandingPicName = userPictures3
        }
    }
    
    
    //画面先から戻る
    @IBAction func unwind(_segue: UIStoryboardSegue){
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = userPictures1
        button.setTitle("再生", for: .normal)
        button.isEnabled = true // ボタン有効
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

