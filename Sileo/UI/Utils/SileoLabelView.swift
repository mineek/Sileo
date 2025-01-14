//
//  SileoLabelView.swift
//  Sileo
//
//  Created by CoolStar on 9/8/19.
//  Copyright © 2019 Sileo Team. All rights reserved.
//

import Foundation

class SileoLabelView: UILabel {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        weak var weakSelf = self
        NotificationCenter.default.addObserver(weakSelf as Any,
                                               selector: #selector(updateSileoColors),
                                               name: SileoThemeManager.sileoChangedThemeNotification,
                                               object: nil)
        self.textColor = .sileoLabel
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        weak var weakSelf = self
        NotificationCenter.default.addObserver(weakSelf as Any,
                                               selector: #selector(updateSileoColors),
                                               name: SileoThemeManager.sileoChangedThemeNotification,
                                               object: nil)
        self.textColor = .sileoLabel
    }
    
    @objc func updateSileoColors() {
        self.textColor = .sileoLabel
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        updateSileoColors()
    }
}
