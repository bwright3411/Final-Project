

import UIKit
import SpriteKit

class GameViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
   
    let skView = self.view as! SKView
    skView.showsFPS = true
    skView.showsNodeCount = true
    
   
    skView.ignoresSiblingOrder = true
    
   
    let scene = GameScene(size: skView.frame.size)
    skView.presentScene(scene)
    
  
    NotificationCenter.default.addObserver(self, selector: #selector(GameViewController.handleApplicationWillResignActive(_:)), name: NSNotification.Name.UIApplicationWillResignActive, object: nil)
    
    NotificationCenter.default.addObserver(self, selector: #selector(GameViewController.handleApplicationDidBecomeActive(_:)), name: NSNotification.Name.UIApplicationDidBecomeActive, object: nil)
  }
  
  override var prefersStatusBarHidden: Bool {
    return true
  }
  
  override var shouldAutorotate: Bool {
    return true
  }
  
  override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    return UIInterfaceOrientationMask.portrait
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
 
  }
  
  func handleApplicationWillResignActive (_ note: Notification) {
    let skView = self.view as! SKView
    skView.isPaused = true
  }
  
  func handleApplicationDidBecomeActive (_ note: Notification) {
    let skView = self.view as! SKView
    skView.isPaused = false
  }
  
}
