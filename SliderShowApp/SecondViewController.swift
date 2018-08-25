//
//  SecondViewController.swift
//  SliderShowApp
//
//  Created by yuito miyamoto on 2018/08/25.
//  Copyright © 2018年 yuito miyamoto. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var expandedPic: UIImageView!
    
    var expandingPicName:Any = ""
    
    
    //3枚の写真の変数を設定
    let userPictures1 = UIImage(named: "userPic1")!
    let userPictures2 = UIImage(named: "userPic2")!
    let userPictures3 = UIImage(named: "userPic3")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        expandedPic.image = (expandingPicName as! UIImage)
        // Do any additional setup after loading the view.
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
