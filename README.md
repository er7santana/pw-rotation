# PW-Rotation

Sample app for iOS written in Swift to demonstrate how to disable screen rotations on specific ViewControllers.


\
\
Step 1 - In AppDelegate.swift

```swift
 var blockRotation: Bool = false

 func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        if (self.blockRotation) {
            print("supportedInterfaceOrientations - PORTRAIT")
            return .portrait
        } else {
            print("supportedInterfaceOrientations - ALL")
            return .allButUpsideDown
        }
    }
```
\
\
2 - In the ViewControllers that you want to force portrait mode, modify ```viewDidLoad```, ```viewWillAppear``` and ```viewWillDisappear```

```swift
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // disable screen rotations
        (UIApplication.shared.delegate as! AppDelegate).blockRotation = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // force portrait orientation
        UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // enable screen rotations
        (UIApplication.shared.delegate as! AppDelegate).blockRotation = false
    }


