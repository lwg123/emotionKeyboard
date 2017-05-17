//
//  ViewController.swift
//  表情键盘
//
//  Created by weiguang on 2017/5/5.
//  Copyright © 2017年 weiguang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    lazy var emotionVC: EmotionController = EmotionController {[weak self] (emotion) in
        
        //self?.insertEmotionIntoTextView(emotion: emotion)
        self!.textView.insertEmotion(emotion: emotion)
    }
    
    /*
     // 此函数封装成为UITextView的扩展方法
    fileprivate func insertEmotionIntoTextView(emotion: Emotion) {
        // 1.空白表情
        if emotion.isEmpty {
            return
        }
        
        // 2.删除表情
        if emotion.isRemove {
            textView.deleteBackward()
            return
        }
        
        // 3.emoji表情
        if emotion.emojiCode != nil {
            // 获取光标所在的位置
            let textRange = textView.selectedTextRange!
            
            // 替换emoji表情
            textView.replace(textRange, withText: emotion.emojiCode!)
            return
        }
        
        // 4.普通表情,图文混排
        // 4.1 根据图片路径创建属性字符串
        let attchment = EmotionAttachment()
        attchment.chs = emotion.chs
        attchment.image = UIImage(contentsOfFile: emotion.pngPath!)
        // 修改图片大小与行高一致
        let font = textView.font!
        attchment.bounds = CGRect(x: 0, y: -4, width: font.lineHeight, height: font.lineHeight)
        let attrImageStr = NSAttributedString(attachment: attchment)
        
        // 4.2 创建可变的属性字符串
        let attrMStr = NSMutableAttributedString(attributedString: textView.attributedText)
        
        // 4.3 将图片替换到适当位置
        // 获取光标位置
        let range = textView.selectedRange
        
        // 替换属性字符串
        attrMStr.replaceCharacters(in: range, with: attrImageStr)
        // 显示属性字符串
        textView.attributedText = attrMStr
        
        // 将文字大小设为原值，否则会变小(注意坑)
        textView.font = font
        
        // 将光标设置为原来位置 + 1，否则会跳到文字最后 (注意坑)
        textView.selectedRange = NSRange(location: range.location + 1, length: 0)
    }
 */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.inputView = emotionVC.view
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        textView.becomeFirstResponder()
    }

    // 此函数封装成为UITextView的扩展方法
    @IBAction func sendItemClick(_ sender: Any) {
        print(textView.getEmotionString())
    }

}









