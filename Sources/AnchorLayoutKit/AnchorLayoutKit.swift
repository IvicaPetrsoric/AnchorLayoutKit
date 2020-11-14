import UIKit

//MARK:- return proeprties as struct

/// definition of anchors and sizes of constraints, used as return parameters
public struct AnchoredConstraints {
    
    public var top: NSLayoutConstraint?
    public var leading: NSLayoutConstraint?
    public var bottom: NSLayoutConstraint?
    public var trailing: NSLayoutConstraint?
    public var width: NSLayoutConstraint?
    public var height: NSLayoutConstraint?

}

public extension UIView {
    
    
//     MARK:- properties
    
    /// safe area top anchor
    var safeTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.topAnchor
        }
        return self.topAnchor
    }
    
    /// safe area leadnig anchor
    var safeLeadingAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *){
            return self.safeAreaLayoutGuide.leadingAnchor
        }
        return self.leadingAnchor
    }
    
    /// safe area bottom anchor
    var safeBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.bottomAnchor
        }
        return self.bottomAnchor
    }
    
    /// safe area trailing anchor
    var safeTrailingAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *){
            return self.safeAreaLayoutGuide.trailingAnchor
        }
        return self.trailingAnchor
    }
    
    
//    MARK:- base anchor methods
    
    /// Apply anchors, paddings and size to specific view
    /// - Parameters:
    ///   - top: if not nil apply top anchor to a view
    ///   - leading: if not nil apply leading anchor to a view
    ///   - bottom: if not nil apply bottom anchor to a view
    ///   - trailing: if not nil apply trailing anchor to a view
    ///   - padding: padding for every anchor, every one goes as plus padding, defaulted to zero
    ///   - size: define width or height of view, defaulted to zero
    /// - Returns: returns struct with anchor constraints and sizes of view
    @discardableResult
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?,
                padding: UIEdgeInsets = .zero,
                size: CGSize = .zero) -> AnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        
        var anchoredConstraints = AnchoredConstraints()
        
        if let top = top {
            anchoredConstraints.top = topAnchor.constraint(equalTo: top, constant: padding.top)
        }
        
        if let leading = leading {
            anchoredConstraints.leading = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
        }
        
        if let bottom = bottom {
            anchoredConstraints.bottom = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
        }
        
        if let trailing = trailing {
            anchoredConstraints.trailing = trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
        }
        
        if size.width != 0 {
            anchoredConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
        }
        
        if size.height != 0 {
            anchoredConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
        }
        
        [anchoredConstraints.top, anchoredConstraints.leading, anchoredConstraints.bottom, anchoredConstraints.trailing, anchoredConstraints.width, anchoredConstraints.height].forEach{ $0?.isActive = true }
        
        return anchoredConstraints
    }
    
    /// Constraint anchors to fill supper view with padding
    /// - Parameter padding: paddings for every anchor (top, leading, bottom, trailing)
    func anchorFillSuperview(padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false

        if let superviewTopAnchor = superview?.topAnchor {
            topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top).isActive = true
        }
        
        if let superviewBottomAnchor = superview?.bottomAnchor {
            bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom).isActive = true
        }
        
        if let superviewLeadingAnchor = superview?.leadingAnchor {
            leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: padding.left).isActive = true
        }
        
        if let superviewTrailingAnchor = superview?.trailingAnchor {
            trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right).isActive = true
        }
    }
    
    /// Constraint anchors to fill supper view safe are with padding
    /// - Parameter padding: paddings for every anchor (top, leading, bottom, trailing)
    func anchorFillSafeAreaSuperview(padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false

        if let superviewTopAnchor = superview?.safeTopAnchor {
            topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top).isActive = true
        }
        
        if let superviewBottomAnchor = superview?.safeBottomAnchor {
            bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom).isActive = true
        }
        
        if let superviewLeadingAnchor = superview?.safeLeadingAnchor {
            leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: padding.left).isActive = true
        }
        
        if let superviewTrailingAnchor = superview?.safeTrailingAnchor {
            trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right).isActive = true
        }
    }
    
    
//    MARK:- Base anchor methods depending on X and Y position on axis of view
    
    /// Apply X anchor to center of super view with padding
    /// - Parameter constant: padding for X anchor, to move the view left or right on the X axis from the ceter
    func anchorCenterXToSuperview(constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let anchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        }
    }
    
    /// Apply  Y anchor to center of super view with padding
    /// - Parameter constant: padding for Y anchor, to move the view up or down on the Y axis from the center
    func anchorCenterYToSuperview(constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let anchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        }
    }
    
    /// Apply X and Y anchor to be centered to super view
    /// - Parameters:
    ///   - constantX: padding for X anchor, to move the view left or right on the X axis from the ceter
    ///   - constantY: padding for Y anchor, to move the view up or down on the Y axis from the center
    func anchorCenterSuperview(constantX: CGFloat = 0, constantY: CGFloat = 0) {
        anchorCenterXToSuperview(constant: constantX)
        anchorCenterYToSuperview(constant: constantY)
    }
    
    /// Apply X and Y anchor to be centered to super view X and Y with specific size and X and Y paddings
    /// - Parameters:
    ///   - size: width and height of the view
    ///   - constantX: padding for X anchor, to move the view left or right on the X axis from the ceter
    ///   - constantY: padding for Y anchor, to move the view up or down on the Y axis from the center
    func anchorCenterSuperview(size: CGSize = .zero, constantX: CGFloat = 0, constantY: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let superviewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superviewCenterXAnchor, constant: constantX).isActive = true
        }
        
        if let superviewCenterYAnchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: superviewCenterYAnchor, constant: constantY).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    /// Apply X anchor to center of custom view with padding
    /// - Parameters:
    ///   - view: custom view
    ///   - constant: padding for X anchor, to move the view left or right on the X axis from the ceter of the custom view
    func anchorCenterXToView(_ view: UIView, constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: constant).isActive = true
    }
    
    /// Apply  Y anchor to center of custom view with padding
    /// - Parameters:
    ///   - view: custom view
    ///   - constant: padding for Y anchor, to move the view up or down on the Y axis from the center of the custom view
    func anchorCenterYToView(_ view: UIView, constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
    }
    
    /// Apply X and Y anchor to be centered to custom view
    /// - Parameters:
    ///   - view: custom view
    ///   - constantX: padding for X anchor, to move the view left or right on the X axis from the ceter of the custom view
    ///   - constantY: padding for Y anchor, to move the view up or down on the Y axis from the center of the custom view
    func anchorCenterToView(_ view: UIView, constantX: CGFloat = 0, constantY: CGFloat = 0) {
        anchorCenterXToView(view, constant: constantX)
        anchorCenterYToView(view, constant: constantY)
    }
    
    /// Apply X and Y anchor to be centered to custom view X and Y with specific size and X and Y paddings
    /// - Parameters:
    ///   - view: custom view
    ///   - size: width and height of the view
    ///   - constantX: padding for X anchor, to move the view left or right on the X axis from the ceter of the custom view
    ///   - constantY: padding for Y anchor, to move the view up or down on the Y axis from the center of the custom view
    func anchorCenterToView(_ view: UIView, size: CGSize = .zero, constantX: CGFloat = 0, constantY: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false

        centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: constantX).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constantY).isActive = true
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    
//    MARK:- Anchors for setting width and height as constant or multiplied secific anchors
    
    /// Apply constant width to width anchor of view
    /// - Parameter constant: width constant
    func anchorConstraintWidth(constant: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: constant).isActive = true
    }
    
    /// Apply constant width to height anchor of view
    /// - Parameter constant: height constant
    func anchorConstraintHeight(constant: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: constant).isActive = true
    }
    
    /// Apply width and height anchors with constants
    /// - Parameters:
    ///   - constantX: width constant
    ///   - constantY: height constant
    func anchorConstraintSize(constantX: CGFloat, constantY: CGFloat) {
        anchorConstraintWidth(constant: constantX)
        anchorConstraintHeight(constant: constantY)
    }
    
    /// Apply width anchor with custom view width anchor with multiplier if needed
    /// - Parameters:
    ///   - anchor: custom view width anchor
    ///   - multiplier: width multiplier
    func anchorConstraintWidth(anchor: NSLayoutDimension, multiplier: CGFloat = 1.0) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalTo: anchor, multiplier: multiplier).isActive = true
    }

    /// Apply height anchor with custom view height anchor with multiplier if needed
    /// - Parameters:
    ///   - anchor: custom view height anchor
    ///   - multiplier: height multiplier
    func anchorConstraintHeight(anchor: NSLayoutDimension, multiplier: CGFloat = 1.0) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalTo: anchor, multiplier: multiplier).isActive = true
    }
    
    /// Apply width and height anchors with constraint anchors with multipliers
    /// - Parameters:
    ///   - anchorWidth: custom view width anchor
    ///   - multiplierWidth: width multiplier
    ///   - anchorHeight: custom view height anchor
    ///   - multiplierHeight: height multiplier
    func anchorConstraintSize(anchorWidth: NSLayoutDimension, multiplierWidth: CGFloat = 1.0,
                              anchorHeight: NSLayoutDimension, multiplierHeight: CGFloat = 1.0) {
        anchorConstraintWidth(anchor: anchorWidth, multiplier: multiplierWidth)
        anchorConstraintHeight(anchor: anchorHeight, multiplier: multiplierHeight)
    }
    
    
//    MARK:- Clearing constraints
    
    /// Remove all anchors applyed to the view
    func anchorRemoveConstraints() {
        var _superview = self.superview
        
        while let superview = _superview {
            for constraint in superview.constraints {
                
                if let first = constraint.firstItem as? UIView, first == self {
                    superview.removeConstraint(constraint)
                }
                
                if let second = constraint.secondItem as? UIView, second == self {
                    superview.removeConstraint(constraint)
                }
            }
            
            _superview = superview.superview
        }
        
        self.removeConstraints(self.constraints)
        self.translatesAutoresizingMaskIntoConstraints = true
    }
    
}


// MARK:- Extra functionalities

public extension UIView {
    
    /// add an array of views on a view
    func addSubviews(_ views: UIView...) {
        views.forEach({addSubview($0)})
    }
    
}

public extension NSLayoutConstraint {
    
    /// Set layout priority to constraint
    /// - Parameter priority: layout priority
    /// - Returns: constraint with specific priority
    @discardableResult
    func withPriority(_ priority: UILayoutPriority) -> Self {
        self.priority = priority
        return self
    }
    
    /// activate constraint
    func activate() {
        self.isActive = true
    }
    
    /// deactivate constraint
    func deActivate() {
        self.isActive = false
    }

}

public extension UIWindow {
    
    /// returns optional keywindow
    static var keyWindow: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
    
}


