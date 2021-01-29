//
//  NextViewController.swift
//  swift_tutorial_table
//
//  Created by 早川マイケル on 2021/01/29.
//

import UIKit

class NextViewController: UIViewController {

    var todoString = String()
    @IBOutlet weak var todoLabel: UILabel!

    // 最初の一度だけ呼ばれる
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        todoLabel.text = todoString
    }
    
    // 画面呼び出し時のみ呼ばれる
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        
        // ナビゲーションバーを隠さない
        navigationController?.isNavigationBarHidden = false
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
