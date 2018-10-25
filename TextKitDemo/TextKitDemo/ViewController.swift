//
//  ViewController.swift
//  TextKitDemo
//
//  Created by Fury on 2018/7/3.
//  Copyright © 2018年 Fury. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var demoLabel: UILabel!
    
    @IBOutlet weak var pushAction: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        demoLabel.text = "Don't hate"
        displayText()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func pushAction(_ sender: UIButton) {
        
        var arry: [Any] = Array(repeating: 1, count: 10) as [Any]
        let newArry = [2,3,4,5,6]
        arry.append(newArry)
        
        let vc = UIViewController()
        vc.title = "fjeihfu"
        vc.view.backgroundColor = .red
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func displayText() {
        guard let originalFont = UIFont(name: "Chalkboard SE", size: 24) else { return }
        let boldFontDescriptor = originalFont.fontDescriptor.withSymbolicTraits(.traitBold)
        let boldFont = UIFont(descriptor: boldFontDescriptor!, size: originalFont.pointSize)
        
        let newText = NSMutableAttributedString(string: "hello world")
        
        newText.addAttribute(.font, value: boldFont, range: NSMakeRange(0, (demoLabel.text?.count)!))
        newText.addAttribute(.foregroundColor, value: UIColor.orange, range: NSMakeRange(0, (demoLabel.text?.count)!))
        demoLabel.attributedText = newText
    }


}

