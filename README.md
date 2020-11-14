# AnchorLayoutKit

AnchorLayoutKit is a simple layout tool for iOS.

## **The guiding thought**
Ever wonder how to increase productivity while building iOS layout in code?
Bored of typing repetitive code with 5 lines just to put a UIView on view?

Look no further because **AnchorLayoutKit** will help you to improve productivity to build **world-scale applications.**

## **Real scale apps**
**Top 5 App Store (USA)** application using this kit:
- [Recolor, download it on App Store](https://apps.apple.com/us/app/recolor-adult-coloring-book/id1027352017)

New spin off application from Recolor also builded with this kit:
- [RBN (Recolor By Numbers), download it on App Store](https://apps.apple.com/us/app/recolor-by-numbers/id1411398756)


## **Usage**
- Adding simple red UIView element on the view, defining anchors, size and padding
```swift
override func viewDidLoad() {
    super.viewDidLoad()
    
    // setup
    
    let redView = UIView()
    redView.backgroundColor = .red

    view.addSubview(redView)
    
    // implementation adding redView to fill whole view
}
```

- - Old Way 
```swift
    // implementation adding redView to fill whole view

    redView.translatesAutoresizingMaskIntoConstraints = false
    redView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    redView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    redView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    redView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
```
- - **NEW WAY**
- - - A) Anchor to whole supper view
```swift
    // implementation adding redView to fill whole view 

    redView.anchor(top: view.topAnchor, leading: view.leadingAnchor,
                   bottom: view.bottomAnchor, trailing: view.trailingAnchor)
```
- - - B) Anchor to whole supper view
```swift
    // implementation adding redView to fill whole view 
    
    redView.anchorFillSuperview()
```

- - - C) Anchor to whole supper view but taking safe area in account, also adding some padding to leading and trailing anchor
```swift
    // implementation adding redView to fill whole view 
    
    redView.anchorFillSuperview(padding: .init(top: 0, left: 8, bottom: 0, right: 28))
```

- - Adding view depending on other view 
- - - A) Depending on self.view
```swift
    // implementation adding redView to fill whole view but taking safe area in account

    redView.anchor(top: view.topAnchor, leading: view.leadingAnchor,
                   bottom: view.bottomAnchor, trailing: view.trailingAnchor)
```

- - - B) Depending on other view, like red View
```swift
    // setup
    
    let redView = UIView()
    redView.backgroundColor = .red
    
    let blueView = UIView()
    blueView.backgroundColor = .blue

    view.addSubview(redView)
    view.addSubview(blueView)
    
    // set red view somewhere on the view, with padding on top and leading anchor and specific size
    
    redView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil,
                   padding: .init(top: 20, left: 40, bottom: 0, right: 0),
                   size: .init(width: 48, height: 48))
                   
    // set blue view depending on the red view (top denepnding on bottom of red view, leading depending on trailing of red view) with extra padding (top in plus, left in minus) and specific size
    
    blueView.anchor(top: redView.bottomAnchor, leading: redView.trailingAnchor, bottom: nil, trailing: nil,
                    padding: .init(top: 30, left: -14, bottom: 0, right: 0),
                    size: .init(width: 64, height: 128))
```
- - - C) Depending on other view, like red View but with centering on X axis (super view)
```swift
    // blue view with anchor top on red view but center on x axis depending on super view
    
    blueView.anchorCenterXToSuperview()
    blueView.anchor(top: redView.bottomAnchor, leading: nil, bottom: nil, trailing: nil,
                    padding: .init(top: 30, left: 0, bottom: 0, right: 0),
                    size: .init(width: 64, height: 128))
```
- - - D) Depending on other view, like red View but with centering on Y axis (super view), padding is on trailing with positive padding
```swift
    // Center on Y axis (super view), trailing anchor on red trailing and moved to left by 30 px

    blueView.anchorCenterYToSuperview()
    blueView.anchor(top: nil, leading: nil, bottom: nil, trailing: redView.trailingAnchor,
                    padding: .init(top: 0, left: 0, bottom: 0, right: 40),
                    size: .init(width: 64, height: 128))
```
- - - E) Depending on other view, like red View but with centering on X axis (red view), padding is on top anchor with positive padding
```swift
    blueView.anchorCenterXToView(redView)
    blueView.anchor(top: redView.bottomAnchor, leading: nil, bottom: nil, trailing: nil,
                    padding: .init(top: 60, left: 0, bottom: 0, right: 40),
                    size: .init(width: 64, height: 128))
```

- - - F) Depending on other view, like red View but with centering on X axis (red view) with padding to the left on x axis, padding is on top anchor with positive padding
```swift
    blueView.anchorCenterXToView(redView, constant: 40)
    blueView.anchor(top: redView.bottomAnchor, leading: nil, bottom: nil, trailing: nil,
                    padding: .init(top: 60, left: 0, bottom: 0, right: 40),
                    size: .init(width: 64, height: 128))
```

- - Centering View 
- - - A) With secific size
```swift
    blueView.anchorCenterSuperview(size: .init(width: 88, height: 88))
```
- - - B) With secific size, and padding to the right and bit down
```swift
    blueView.anchorCenterSuperview(size: .init(width: 88, height: 88),
                                   constantX: 40,
                                   constantY: 30)
```
- - Setting specific sizes
- - - A) Setting with/hegith/both as constants
```swift
    // setup
    
    blueView.anchor(top: redView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil,
                    padding: .init(top: 60, left: 60, bottom: 0, right: 0))
                    
    // setup width
    
    blueView.anchorConstraintWidth(constant: 80)
    
    // setup height
    
    blueView.anchorConstraintHeight(constant: 80)

    // setup width and height
    
    blueView.anchorConstraintSize(constantX: 80, constantY: 80)
```
- - - B) Setting width/height depending on a specific widht/height anchor of view
```swift

    // setup 
    blueView.anchor(top: redView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil,
                    padding: .init(top: 60, left: 60, bottom: 0, right: 0))
                    
    // set width anchor to red view anchor and multiplied wtih 2 (default 1.0)
    
    blueView.anchorConstraintWidth(anchor: redView.widthAnchor, multiplier: 2)

    // set height to specific constant
    
    blueView.anchorConstraintHeight(constant: 80)
```

- - Remove **ALL** applied constraints to specific view
```swift
    blueView.anchorRemoveConstraints()
```

- - Extra
- - - A) Add multiple views in one line
```swift
    view.addSubviews(redView, blueView, yellowView, greenView)
```
- - - B) KeyWindow
```swift

    // get keywindow as optional (old ways UIApplication.shared.keyWindow)
    
    if let keyWindow = UIWindow.keyWindow {
        // do stuff
    }
```

- - **Animations**
If want to animate a specific anchor, don't worry, there is an easy way in this kit, just use the anchor you want and update it
- - - Aniamte top anchor
```swift

```





```swift

```
