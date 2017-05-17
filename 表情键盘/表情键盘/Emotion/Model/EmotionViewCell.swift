//
//  EmotionViewCell.swift
//  表情键盘
//
//  Created by weiguang on 2017/5/8.
//  Copyright © 2017年 weiguang. All rights reserved.
//

import UIKit

class EmotionViewCell: UICollectionViewCell {
    lazy var emotionBtn: UIButton = UIButton()
    var imaView: UIImageView = UIImageView()
    
    var emotion: Emotion? {
        didSet {
            guard let emotion = emotion else {
                return
            }
            
            emotionBtn.setImage(UIImage(contentsOfFile: emotion.pngPath ?? ""), for: .normal)
            emotionBtn.setTitle(emotion.emojiCode, for: .normal)
            
            // 设置删除按钮
            if emotion.isRemove {
                emotionBtn.setImage(UIImage(named: "compose_emotion_delete"), for: .normal)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EmotionViewCell {
    fileprivate func setupUI() {
        // 添加子控件
        contentView.addSubview(emotionBtn)
        contentView.addSubview(imaView)
        
        // 设置btn的frame
        emotionBtn.frame = contentView.bounds
        imaView.frame = contentView.bounds
        // 设置btn属性
        emotionBtn.isUserInteractionEnabled = false
        emotionBtn.titleLabel?.font = UIFont.systemFont(ofSize: 32)
    }
}
