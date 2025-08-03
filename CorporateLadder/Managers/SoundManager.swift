//
//  SoundManager.swift
//  CorporateLadder
//
//  Created by Tiago Camargo Maciel dos Santos on 03/08/25.
//

import AVKit

class SoundManager {
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    
    func playSound(name: String, volume: Float = 1) {
        guard let url = Bundle.main.url(forResource: name, withExtension: "mp3") else { return }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.volume = volume
            player?.play()
        } catch {
            print("Erro ao reproduzir som: \(error)")
        }
    }
}
