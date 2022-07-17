//
//  NextViewViewController.swift
//  NewNetflixProject
//
//  Created by Carki on 2022/07/17.
//

import UIKit

class NextViewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func backBtn(_ sender: UIButton) {
//        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "BViewController") else {return}
        self.navigationController?.popViewController(animated: true)
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
