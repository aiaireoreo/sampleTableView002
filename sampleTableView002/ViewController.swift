//
//  ViewController.swift
//  sampleTableView002
//
//  Created by AI Matsubara on 2016/05/09.
//  Copyright © 2016年 AI Matsubara. All rights reserved.
//

import UIKit

//プロトコルを指定
class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    //テーブル一覧から選ばれた行番号
    var selectedIndex = -1
    
    
    //表示する紅茶のリスト
    var teaList = ["ダージリン","アールグレイ","アッサム","オレンジペコ"]
    
    
    //TODO:teaListをmyTableViewに表示してみましょう
    //表示する行数を設定
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        return 3
        return teaList.count
        //４と書くよりカウントを使うほうが柔軟になる
    }
    
    //表示するセルの中身
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: .Default, reuseIdentifier: "myCell")
        cell.textLabel!.text = teaList[indexPath.row] //teaListからデータを取り出す
        
        return cell
    }
    
    //選択されたらデバックに紅茶の名前を出す、選択されたときに行う処理
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("\(indexPath.row)行目を選択")
        
        //各紅茶のディテールページにそれぞれ遷移させるための用意
        selectedIndex = indexPath.row
        
        //指定したセグエを使用して画面遷移する
        performSegueWithIdentifier("showDetailView", sender: nil)
        
    }
    
    //セグエで画面遷移する時、画面を移動するところだよ（準備している）
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetailView"{
            if let indexPath = self.myTableView.indexPathForSelectedRow{ //今押された紅茶の番号がindexPathに代入される
                //=が１個の場合は、代入と判定が同時に行われる
                let object = teaList[indexPath.row] as String
                let controller = segue.destinationViewController as! detailViewController //次の画面にインスタンス化
                //segue.destinationViewControlleはアバウトな行き先、as! detailViewControllerで行き先が具体的になる（インスタンス化）
                controller.detailItem = object
                
            }
        }
        
        //DetailViewをインスタンス化
//        var detailVC = segue.destinationViewController as!detailViewController
//        detailVC.selectedIndex = selectedIndex
        //それぞれ別の画面のプロパティ
        
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