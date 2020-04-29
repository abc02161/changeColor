import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var iceCream: UIImageView!
    @IBOutlet weak var backGroundColor: UIView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    
    @IBOutlet weak var redValue: UILabel!
    @IBOutlet weak var greenValue: UILabel!
    @IBOutlet weak var blueValue: UILabel!
    @IBOutlet weak var alphaValue: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // slider 初始值皆為1
        showValue(red: 1, green: 1, blue: 1, alpha: 1)
        
        // 建立顯示漸層顏色物件, 大小與位置等於 backGroundColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = backGroundColor.bounds
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.yellow.cgColor, UIColor.red.cgColor]
        
        backGroundColor.layer.addSublayer(gradientLayer)
        
    }

    // 隨機調色
    @IBAction func randomColor(_ sender: Any) {
        
        redSlider.value = Float.random(in: 0...1)
        greenSlider.value = Float.random(in: 0...1)
        blueSlider.value = Float.random(in: 0...1)
        alphaSlider.value = Float.random(in: 0...1)
        
        iceCream.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        
        showValue(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        
    }
    
    // 手動調色
    @IBAction func changeColor(_ sender: Any) {
        
        iceCream.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        
        showValue(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        
    }
    
    // 顯示各個 slider 數值
    func showValue(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> () {
        redValue.text = String(format: "%.2f", red)
        greenValue.text = String(format: "%.2f", green)
        blueValue.text = String(format: "%.2f", blue)
        alphaValue.text = String(format: "%.2f", alpha)
    }
    
}

