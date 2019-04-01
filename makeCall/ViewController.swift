
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblNumber: UILabel!
    @IBOutlet weak var txtNumber: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblNumber.text = "9988998899"
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapFunction))
        lblNumber.isUserInteractionEnabled = true
        lblNumber.addGestureRecognizer(tap)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tapFunction(sender:UITapGestureRecognizer) {
        print("tap working")
        let number = "tel://" + lblNumber.text!
        let url:NSURL = NSURL(string: number)!
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func btnCall(_ sender: UIButton) {
        if txtNumber.text != ""{
            let number = "tel://" + txtNumber.text!
            let url:NSURL = NSURL(string: number)!
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
        else{
            
            let alert = UIAlertController(title: "Error..!", message: "Please Enter Mobile Number..!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                switch action.style{
                case .default:
                    print("default")
                    
                case .cancel:
                    print("cancel")
                    
                case .destructive:
                    print("destructive")
                }
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }

}

