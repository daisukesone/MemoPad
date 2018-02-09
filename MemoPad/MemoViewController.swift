//
//  MemoViewController.swift
//  MemoPad
//
//  Created by 曽根大輔 on 2018/02/08.
//  Copyright © 2018年 曽根大輔. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!
    
    var saveData: UserDefaults = UserDefaults.standard
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.text = saveData.object(forKey: "title") as? String
        contentTextView.text = saveData.object(forKey: "content") as? String
        titleTextField.delegate = self
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveMemo(){
        
        //userdefaultに書き込み
        saveData.set(titleTextField.text, forKey: "title")
        saveData.set(contentTextView.text, forKey: "content")
        
        //アラートを出す
        let alart: UIAlertController = UIAlertController(title:"保存", message:"メモの保存が完了しました", preferredStyle:.alert)
        
        //okボタン
        alart.addAction(
            UIAlertAction(
                title: "OK.",
                style: .default,
                handler: {action in
                    //ボタンが押された時の動作
                    self.navigationController?.popViewController(animated: true)
                    print("OKボタンが押されました")
                    
            }
           )
        )
        present(alart, animated: true, completion: nil)
        
        
    
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
