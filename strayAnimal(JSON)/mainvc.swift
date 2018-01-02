import UIKit

class mainvc: UITableViewController {

    var animals: [Strayanimal] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }

    func fetchData() {
        let urlString = "http://data.coa.gov.tw/Service/OpenData/AnimalOpenData.aspx"
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        let session = URLSession.shared
        let datatask = session.dataTask(with: request) { (data, response, error) in
            if error != nil {
                print(error.debugDescription)
            } else {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [[String: Any]] {
                        for alldata in json {
                            if let animalObject = try? Strayanimal(json: alldata) {
                                self.animals.append(animalObject)
//                                print(self.animals)
                            }
                        }

                    }
                    
                } catch {
                    print("jsonErr")
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        } as URLSessionTask
        datatask.resume()
    }
  


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellid = "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid)!
        let animal = animals[indexPath.row]
        cell.textLabel?.text = animal.kind
        cell.detailTextLabel?.text = animal.sex
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail" {
            let indexpath = tableView.indexPath(for: sender as! UITableViewCell)
            let animal = animals[indexpath!.row]
            let detailVC = segue.destination as! detailVC
            detailVC.animals = animal
            
        }
    }

    

}
