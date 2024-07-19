
import UIKit

class JXButton: UIButton {
    lazy var jx_font: UIFont? = self.titleLabel?.font {
        didSet {
            self.titleLabel?.font = jx_font
        }
    }
    
    var maxTitleWidth: CGFloat = 0
    var titleDirection: UITextLayoutDirection?
    
    ///文字与图片的间距
    var space: CGFloat = 0
    
    private var imageRect: CGRect = .zero
    private var titleRect: CGRect = .zero
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override var intrinsicContentSize: CGSize {
        
        var width: CGFloat = 0
        var height: CGFloat = 0
        switch titleDirection {
        case .left:
            width = imageRect.width + titleRect.width + space
            if imageRect.height > titleRect.height {
                height = imageRect.height
            } else {
                height = titleRect.height
            }
            
        case .up:
            if imageRect.width > titleRect.width {
                width = imageRect.width
            } else {
                width = titleRect.width
            }
            height = titleRect.height + imageRect.height + space
            
        case .down:
            if imageRect.width > titleRect.width {
                width = imageRect.width
            } else {
                width = titleRect.width
            }
            height = titleRect.height + imageRect.height + space
            
        default:
            width = imageRect.width + titleRect.width + space
            if imageRect.height > titleRect.height {
                height = imageRect.height
            } else {
                height = titleRect.height
            }
        }
        
        let size = CGSize(width: width, height: height)
        return size
    }
    
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        let imageSize = currentImage?.size ?? .zero
        let textSize = self._textSize()
        let contentWidth = self.frame.size.width
        let contentHeight = self.frame.size.height
        
        var x: CGFloat = 0
        var y: CGFloat = 0
        var width: CGFloat = 0
        var height: CGFloat = 0
        
        switch titleDirection {
        case .left:
            x = (contentWidth - space) / 2 - imageSize.width / 2 + textSize.width / 2 + space
            y = contentHeight / 2 - imageSize.height / 2
            width = imageSize.width
            height = imageSize.height
            
        case .up:
            x = contentWidth / 2 - imageSize.width / 2
            y = (contentHeight - space) / 2 - imageSize.height / 2 + textSize.height / 2 + space
            width = imageSize.width
            height = imageSize.height
            
        case .down:
            x = contentWidth / 2 - imageSize.width / 2
            y = (contentHeight - space) / 2 - imageSize.height / 2 - textSize.height / 2
            width = imageSize.width
            height = imageSize.height
            
        default:
            x = (contentWidth - space) / 2 - imageSize.width / 2 - textSize.width / 2
            y = contentHeight / 2 - imageSize.height / 2
            width = imageSize.width
            height = imageSize.height
        }
        self.imageRect = CGRect(x: x, y: y, width: width, height: height)
        
        return self.imageRect
    }
    
    
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        let imageSize = currentImage?.size ?? .zero
        let textSize = self._textSize()
        let contentWidth = self.frame.size.width
        let contentHeight = self.frame.size.height
        
        var x: CGFloat = 0
        var y: CGFloat = 0
        var width: CGFloat = 0
        var height: CGFloat = 0
        
        switch titleDirection {
        case .left:
            x = (contentWidth - space) / 2 - imageSize.width / 2 - textSize.width / 2
            y = contentHeight / 2 - textSize.height / 2
            width = textSize.width
            height = textSize.height
            
        case .up:
            x = contentWidth / 2 - textSize.width / 2
            y = (contentHeight - space) / 2 - textSize.height / 2 - imageSize.height / 2
            width = textSize.width
            height = textSize.height
            
        case .down:
            x = contentWidth / 2 - textSize.width / 2
            y = (contentHeight - space) / 2 - textSize.height / 2 + imageSize.height / 2 + space
            width = textSize.width
            height = textSize.height
            
        default:
            x = (contentWidth - space) / 2 + imageSize.width / 2 - textSize.width / 2 + space
            y = contentHeight / 2 - textSize.height / 2
            width = textSize.width
            height = textSize.height
        }
        
        self.titleRect = CGRect(x: x, y: y, width: width, height: height)
        return self.titleRect
    }
    
    
    private var borderColors: [UInt : UIColor] = [:]
    
    func jx_setBorderColor(_ color: UIColor?, for state: UIControl.State) {
        var arr = self.borderColors
        let index = state.rawValue
        arr[index] = color
        if state == .selected {
            let i = index + UIControl.State.highlighted.rawValue
            arr[i] = color
        }
        self.borderColors = arr
    }
    
    func updateStatus() {
        var color = self.borderColors[self.state.rawValue]?.cgColor
        if (color == nil) {
            color = self.borderColors[UIControl.State.normal.rawValue]?.cgColor
        }
        self.layer.borderColor = color
    }
    
    override var isSelected: Bool {
        didSet {
            updateStatus()
        }
    }
}


extension JXButton {
    
    private func _textSize() -> CGSize {
        if let font = jx_font {
            let currentTitle = self.currentTitle as? NSString
            
            var size = currentTitle?.boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: CGFloat(MAXFLOAT)),
                                                  options: [.usesLineFragmentOrigin, .usesFontLeading],
                                                  attributes: [.font : font],
                                                  context: nil).size ?? .zero
            
            if maxTitleWidth != 0 && maxTitleWidth < size.width {
                size = CGSize(width: maxTitleWidth, height: size.height)
            }
            return size
        } else {
            return .zero
        }
    }
    
}
