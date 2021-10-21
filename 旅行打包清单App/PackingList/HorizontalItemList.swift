import UIKit

//
// 一个scrollview视图, 里面有10个图片
// 当用户点击其中一个图片时触发回调函数--以显示对应
//
class HorizontalItemList: UIScrollView {
    
    var didSelectItem: ((_ index: Int)->())?
    
    let buttonWidth: CGFloat = 60.0
    let padding: CGFloat = 10.0
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(inView: UIView) {
        let rect = CGRect(x: 0, y: 120.0, width: inView.frame.width, height: 80.0)
        self.init(frame: rect)
        
        alpha = 1.0
        
        for i in 0 ..< 10 {
            let image = UIImage(named: "summericons_100px_0\(i).png")
            let imageView  = UIImageView(image: image)
            imageView.center = CGPoint(x: CGFloat(i) * buttonWidth + buttonWidth/2, y: buttonWidth/2)
            imageView.tag = i
            imageView.isUserInteractionEnabled = true
            addSubview(imageView)
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(HorizontalItemList.didTapImage(_:)))
            imageView.addGestureRecognizer(tap)
        }
        
        contentSize = CGSize(width: padding * buttonWidth, height:  buttonWidth + 2*padding)
    }
    
    @objc func didTapImage(_ tap: UITapGestureRecognizer) {
        didSelectItem?(tap.view!.tag)
    }
}
