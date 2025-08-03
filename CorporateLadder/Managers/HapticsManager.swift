//
//  HapticsManager.swift
//  CorporateLadder
//
//  Created by Tiago Camargo Maciel dos Santos on 03/08/25.
//

import UIKit

class HapticsManager {
        static let shared = HapticsManager()
        private let generator = UINotificationFeedbackGenerator()
        private init() {}
        func play(_ type: UINotificationFeedbackGenerator.FeedbackType) {
            generator.notificationOccurred(type)
        }
    }
