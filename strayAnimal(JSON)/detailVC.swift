import UIKit

class detailVC: UIViewController {
    
    @IBOutlet weak var tvdetail: UITextView!

    @IBOutlet weak var animalImage: UIImageView!
    
    var animals: Strayanimal!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = animals.kind
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

        let text = "Sex: \(animals.sex!)\nType: \(animals.kind!)\nAge: \(animals.age!)\nShelter: \(animals.shelterName!)\nAddress: \(animals.shelterAddress!)\n"
        tvdetail.text! = text
        
    }


    


}
