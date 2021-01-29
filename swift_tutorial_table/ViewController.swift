//
//  ViewController.swift
//  swift_tutorial_table
//
//  Created by 早川マイケル on 2021/01/29.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!

    var textArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        textField.delegate = self
    }
    
    // 画面呼び出し時のみ呼ばれる
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        
        // ナビゲーションバーを隠す
        navigationController?.isNavigationBarHidden = true
    }

    // セクションの数を確認する
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // セクションの中のセルの数を確認する
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArray.count
    }

    // セルを追加する時に実行
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // ハイライトを消す
        cell.selectionStyle = .none
        
        // textLabelが空でない場合テキストを追加
        cell.textLabel?.text = textArray[indexPath.row]
        
        // imageViewが空でない場合画像を追加
        cell.imageView!.image = UIImage(named: "checkImage")
        
        return cell
    }

    // セルをタップした時に実行
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // タップしたセルのテキストを次画面で出力する
        let nextVC = storyboard?.instantiateViewController(identifier: "next") as! NextViewController
        
        nextVC.todoString = textArray[indexPath.row]

        navigationController?.pushViewController(nextVC, animated: true)

    }
    
    // セルの高さを指定する
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.height / 6
    }
    
    // キーボードのreturnキーが押された時に呼ばれるメソッド
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // 入力欄に入力された値を配列に追加
        textArray.append(textField.text!)
        
        // キーボードを閉じる
        textField.resignFirstResponder()
        
        // 入力欄をクリア
        textField.text = ""
        
        // 再描画
        tableView.reloadData()
        
        return true
    }

}

