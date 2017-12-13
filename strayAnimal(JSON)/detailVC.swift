import UIKit

class detailVC: UIViewController {
    
    @IBOutlet weak var tvdetail: UITextView!

    @IBOutlet weak var animalImage: UIImageView!
    
    var animals: Strayanimal!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = animals.name
        let url = URL(string: animals.imageName!)
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.sync {
                self.animalImage.image = UIImage(data: data)
            }
        }
        task.resume()
        
        let text = "Name: \(animals.name!)\nSex: \(animals.sex!)\nType: \(animals.type!)\nAge: \(animals.age!)\nVariety: \(animals.variety!)\nNote: \(animals.note!)\n"
        tvdetail.text! = text
        
    }


    


}
