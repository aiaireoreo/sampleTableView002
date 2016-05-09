//
//  detailViewController.swift
//  sampleTableView002
//
//  Created by AI Matsubara on 2016/05/09.
//  Copyright © 2016年 AI Matsubara. All rights reserved.
//

import UIKit

class detailViewController: UIViewController {
    
    @IBOutlet weak var teaName: UILabel!
    
    //テーブル一覧から選ばれた行番号
    //-1はエラー判別のための数字なので意味はない
    var selectedIndex = -1
    var detailItem:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    //VCからデータを受け取るためのコード
    override func viewWillAppear(animated: Bool) {
        print(selectedIndex)
        print(detailItem)
        teaName.text = detailItem
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
