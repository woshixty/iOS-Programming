import UIKit
import AVFoundation

class ViewController: UIViewController{
    var player:AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func notePressed(_ sender: UIButton) {
        let url = Bundle.main.url(forResource: "note\(sender.tag)", withExtension: "wav")
        
        do{
            player = try AVAudioPlayer(contentsOf: url!)
            player.play()
        }catch{
            print(error)
        }
    }
    
}

