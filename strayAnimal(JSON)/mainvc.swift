import UIKit

class mainvc: UITableViewController {

    
    var animals: [Strayanimal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
       
    }

    func fetchData() {
        let urlString = "http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=f4a75ba9-7721-4363-884d-c3820b0b917c&"
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        let session = URLSession.shared
        let datatask = session.dataTask(with: request) { (data, response, error) in
            if error != nil {
                print(error.debugDescription)
            } else {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String: Any] {
                        if let resultData = json["result"] as? [String: Any] {
                            if let resultsData = resultData["results"] as? [[String: Any]] {
                                for dataPoint in resultsData {
                                    if let animalObject = try? Strayanimal(json: dataPoint) {
                                        print(animalObject)
                                        self.animals.append(animalObject)
                                    }
                                }
                            }
                        }
                    }
                    
                } catch  {
                    print("jsonErr")
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        } as URLSessionTask
        datatask.resume()
    }
  

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellid = "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid)!
        let animal = animals[indexPath.row]
        cell.textLabel?.text = animal.name
        cell.detailTextLabel?.text = animal.type
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
