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

Personal live applications on App Store builded with this kit:
 - Boxline, [Download](https://apps.apple.com/us/app/boxline/id1308313538?ls=1)
 - FDMRI, Manual dexterity exam for enrollment at the Faculty of Dental Medicine of Rijeka. [Download](https://apps.apple.com/us/app/fdmri/id1518196339?ign-mpt=uo%3D4). Req ID for entering app.

## **Requirements**
- iOS 10+
- Xcode 11+
- Swift 5

## **Installation**
### Swift Package Manager

The Swift Package Manager is a tool for automating the distribution of Swift code and is integrated into the swift compiler. It is in early development, but AnchorLayoutKit does support its use on supported platforms.

Once you have your Swift package set up, adding AnchorLayoutKit as a dependency is as easy as adding it to the dependencies value of your Package.swift.

```swift
    dependencies: [
        .package(url: "https://github.com/IvicaPetrsoric/AnchorLayoutKit", .upToNextMajor(from: "1.0.6"))
    ]
```

## **Usage**
Add simple red UIView element on the view, defining anchors, size and padding

```swift
override func viewDidLoad() {
    super.viewDidLoad()
    
    // setup
    
    let redView = UIView()
    redView.backgroundColor = .red

    view.addSubview(redView)
    
    // implementation 
}
```

- Currently with Swift 
```swift
    // add redView to fill whole view

    redView.translatesAutoresizingMaskIntoConstraints = false
    redView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    redView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    redView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    redView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
```
- With AnchorLayoutKit
- - A) Anchor to whole supper view

<table>
  <tr>
    <th width="30%">Implementation</th>
    <th width="30%">Result</th>
  </tr>
  <tr>
    <td>Add redView to fill whole view</td>
    <th rowspan="2"><img src="https://github.com/IvicaPetrsoric/AnchorLayoutKit/blob/main/Readme%20resource/1.png" height = 200></th>
  </tr>
  <tr>
    <td><div class="highlight highlight-source-swift" height = 200><pre>
    
```swift
    redView.anchor(top: view.topAnchor, leading: view.leadingAnchor,
                   bottom: view.bottomAnchor, trailing: view.trailingAnchor)
```

  </tr>
</table>
     
- - B) Anchor to whole supper view
     
```swift
    // add redView to fill whole view 
    
    redView.anchorFillSuperview()
```
- - C) Anchor to whole supper view but taking safe area in account, also adding some padding to leading and trailing anchor

<table>
  <tr>
    <th width="30%">Implementation</th>
    <th width="30%">Result</th>
  </tr>
  <tr>
    <td>Add redView to fill whole view (safe area included) with padding left and right</td>
    <th rowspan="2"><img src="https://github.com/IvicaPetrsoric/AnchorLayoutKit/blob/main/Readme%20resource/2.png" height = 200></th>
  </tr>
  <tr>
    <td><div class="highlight highlight-source-swift" height = 200><pre>
    
```swift
    redView.anchorFillSuperview(padding: .init(top: 0, left: 8, bottom: 0, right: 28))
```
  </tr>
</table>

- Adding view depending on other view 
- - A) Depending on self.view
```swift
    // Add redView to fill whole view but taking safe area in account

    redView.anchor(top: view.topAnchor, leading: view.leadingAnchor,
                   bottom: view.bottomAnchor, trailing: view.trailingAnchor)
```
- - B) Depending on other view, like red View

<table>
  <tr>
    <th width="30%">Implementation</th>
    <th width="30%">Result</th>
  </tr>
  <tr>
    <td>Depending on other view, like red View with padding</td>
    <th rowspan="9"><img src="https://github.com/IvicaPetrsoric/AnchorLayoutKit/blob/main/Readme%20resource/3.png"></th>
  </tr>
  <tr>
    <td><div class="highlight highlight-source-swift"><pre>
    
```swift
    // setup
    
    let redView = UIView()
    redView.backgroundColor = .red
    
    let blueView = UIView()
    blueView.backgroundColor = .blue

    view.addSubview(redView)
    view.addSubview(blueView)
    
    // set red view somewhere on the view, with padding on top 
    // and leading anchor and specific size
    
    redView.anchor(top: view.topAnchor, leading: view.leadingAnchor, 
                   bottom: nil, trailing: nil,
                   padding: .init(top: 20, left: 40, bottom: 0, right: 0),
                   size: .init(width: 48, height: 48))
                   
    // set blue view depending on the red view (top denepnding on bottom of red view, 
    // leading depending on trailing of red view)
    // with extra padding (top in plus, left in minus) and specific size
    
    blueView.anchor(top: redView.bottomAnchor, leading: redView.trailingAnchor,
                    bottom: nil, trailing: nil,
                    padding: .init(top: 30, left: -14, bottom: 0, right: 0),
                    size: .init(width: 64, height: 128)) 
```
    
   </tr>
</table>
Result:

- - C) Depending on other view, like red View but with centering on X axis (super view)

<table>
  <tr>
    <th width="30%">Implementation</th>
    <th width="30%">Result</th>
  </tr>
  <tr>
    <td>Blue view with anchor top on red view but center on x axis depending on super view</td>
    <th rowspan="2"><img src="https://github.com/IvicaPetrsoric/AnchorLayoutKit/blob/main/Readme%20resource/4.png" height = 200></th>
  </tr>
  <tr>
    <td><div class="highlight highlight-source-swift" height = 200><pre>
    
```swift
    blueView.anchorCenterXToSuperview()
    blueView.anchor(top: redView.bottomAnchor, leading: nil, bottom: nil, trailing: nil,
                    padding: .init(top: 30, left: 0, bottom: 0, right: 0),
                    size: .init(width: 64, height: 128))
```
  </tr>
</table>

- - D) Depending on other view, like red View but with centering on Y axis (super view), padding is on trailing with positive padding

<table>
  <tr>
    <th width="30%">Implementation</th>
    <th width="30%">Result</th>
  </tr>
  <tr>
    <td>Center on Y axis (super view), trailing anchor on red trailing and moved to left by 40 px</td>
    <th rowspan="2"><img src="https://github.com/IvicaPetrsoric/AnchorLayoutKit/blob/main/Readme%20resource/5.png" height = 200></th>
  </tr>
  <tr>
    <td><div class="highlight highlight-source-swift" height = 200><pre>
    
```swift
    blueView.anchorCenterYToSuperview()
    blueView.anchor(top: nil, leading: nil, bottom: nil, trailing: redView.trailingAnchor,
                    padding: .init(top: 0, left: 0, bottom: 0, right: 40),
                    size: .init(width: 64, height: 128))
```
  </tr>
</table>

- - E) Depending on other view, like red View but with centering on X axis (red view), padding is on top anchor with positive padding

<table>
  <tr>
    <th width="30%">Implementation</th>
    <th width="30%">Result</th>
  </tr>
  <tr>
    <td>Center X to red view</td>
    <th rowspan="2"><img src="https://github.com/IvicaPetrsoric/AnchorLayoutKit/blob/main/Readme%20resource/6.png" height = 200></th>
  </tr>
  <tr>
    <td><div class="highlight highlight-source-swift" height = 200><pre>
    
```swift
    blueView.anchorCenterXToView(redView)
    blueView.anchor(top: redView.bottomAnchor, leading: nil, bottom: nil, trailing: nil,
                    padding: .init(top: 60, left: 0, bottom: 0, right: 40),
                    size: .init(width: 64, height: 128))
```
  </tr>
</table>

- - F) Depending on other view, like red View but with centering on X axis (red view) with padding to the right on x axis, padding is on top anchor with positive padding

<table>
  <tr>
    <th width="30%">Implementation</th>
    <th width="30%">Result</th>
  </tr>
  <tr>
    <td>Center X to red view with padding 40px</td>
    <th rowspan="2"><img src="https://github.com/IvicaPetrsoric/AnchorLayoutKit/blob/main/Readme%20resource/7.png" height = 200></th>
  </tr>
  <tr>
    <td><div class="highlight highlight-source-swift" height = 200><pre>
    
```swift
    blueView.anchorCenterXToView(redView, constant: 40)
    blueView.anchor(top: redView.bottomAnchor, leading: nil, bottom: nil, trailing: nil,
                    padding: .init(top: 60, left: 0, bottom: 0, right: 40),
                    size: .init(width: 64, height: 128))
```
  </tr>
</table>

- Centering View 
- - A) With secific size

<table>
  <tr>
    <th width="30%">Implementation</th>
    <th width="30%">Result</th>
  </tr>
  <tr>
    <td>Set size to 40x40</td>
    <th rowspan="2"><img src="https://github.com/IvicaPetrsoric/AnchorLayoutKit/blob/main/Readme%20resource/8.png" height = 200></th>
  </tr>
  <tr>
    <td><div class="highlight highlight-source-swift" height = 200><pre>
    
```swift
    blueView.anchorCenterSuperview(size: .init(width: 88, height: 88))
```
  </tr>
</table>

- - B) With secific size, and padding to the right and bit down

<table>
  <tr>
    <th width="30%">Implementation</th>
    <th width="30%">Result</th>
  </tr>
  <tr>
    <td>Set size to 88x88, centered and padding on X and Y from center</td>
    <th rowspan="2"><img src="https://github.com/IvicaPetrsoric/AnchorLayoutKit/blob/main/Readme%20resource/9.png" height = 200></th>
  </tr>
  <tr>
    <td><div class="highlight highlight-source-swift" height = 200><pre>
    
```swift
    blueView.anchorCenterSuperview(size: .init(width: 88, height: 88),
                                   constantX: 40,
                                   constantY: 30)
```
  </tr>
</table>

- Setting specific sizes
- - A) Setting with/hegith/both as constants
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
- - B) Setting width/height depending on a specific widht/height anchor of view

<table>
  <tr>
    <th width="30%">Implementation</th>
    <th width="30%">Result</th>
  </tr>
  <tr>
    <td>Set width anchor to red view anchor and multiplied wtih 2 (default 1.0)</td>
    <th rowspan="2"><img src="https://github.com/IvicaPetrsoric/AnchorLayoutKit/blob/main/Readme%20resource/10.png"></th>
  </tr>
  <tr>
    <td><div class="highlight highlight-source-swift"><pre>
    
```swift
    // setup 
    blueView.anchor(top: redView.bottomAnchor, leading: view.leadingAnchor, 
                    bottom: nil, trailing: nil,
                    padding: .init(top: 60, left: 60, bottom: 0, right: 0))
                    
    // set width to anchor and multiplie it
    
    blueView.anchorConstraintWidth(anchor: redView.widthAnchor, multiplier: 2)

    // set height to specific constant
    
    blueView.anchorConstraintHeight(constant: 80)
```
  </tr>
</table>

- Remove **ALL** applied constraints to specific view
```swift
    blueView.anchorRemoveConstraints()
```

- Extra
- - A) Enable/Disable activate state of constraint
```swift

```
- - B) Add multiple views in one line
```swift
    view.addSubviews(redView, blueView, yellowView, greenView)
```
- - C) KeyWindow
```swift

    // get keywindow as optional (old ways UIApplication.shared.keyWindow)
    
    if let keyWindow = UIWindow.keyWindow {
        // do stuff
    }
```
- - D) out of the box you can get safeTopAnchor which represents top anchor which take in account safe area layout guide. Also the other anchor can be returned with safe area in account
```swift
    // safe area top anchor

    view.safeTopAnchor
    

    // safe area leadnig anchor
    
    view.safeLeadingAnchor
    
    
    // safe area bottom anchor

    view.safeBottomAnchor
    
    
    // safe area trailing anchor
    
    view.safeTrailingAnchor
```

- **Animations** - If want to animate a specific anchor, don't worry, there is an easy way in this kit, just use the anchor method anf pick return anchor you want and update it. In the following expample top anchor is animated
```swift
    // setup
    // picked top anchor as return, can be used self so a return, 
    // self represents AnchoredConstraints struct with top, leading, bottom, trailing,
    // width, height anchor properties, all of those properties can be manipulated/animated
    
    let blueViewtopAnchor = blueView.anchor(top: view.topAnchor, leading: view.leadingAnchor, 
                                            bottom: nil, trailing: nil,
                                            padding: .init(top: 0, left: 0, bottom: 0, right: 0),
                                            size: .init(width: 100, height: 100)).top
                                            
    self.view.layoutIfNeeded()

    // moves the bluew view down of the top anchor for 100 px after one sec and with duration of 5 sec
    
    UIView.animate(withDuration: 5, delay: 1) {
        blueViewtopAnchor?.constant = 100
        self.view.layoutIfNeeded()
    }
```

