import Foundation

struct Strayanimal {
    let id: Int?
    let name: String?
    let sex: String?
    let type: String?
    let age: String?
    let variety: String?
    let note: String?
    let imageName: String?
    
    init(json: [String: Any]) {
        id = json["_id"] as? Int
        name = json["Name"] as? String
        sex = json["Sex"] as? String
        type = json["Type"] as? String
        age = json["Age"] as? String
        variety = json["Variety"] as? String
        note = json["Note"] as? String
        imageName = json["ImageName"] as? String
        
    }
    
    public func info() -> String {
        return "Id: \(id!)/nName: \(name!)/nSex: \(sex!)/nType: \(type!)/nAge: \(age!)/nVariety: \(variety!)/nNote: \(note!)/n"
    }
    
    public func addDtionary() -> NSDictionary {
        var animalDic = [String: Any]()
        animalDic["id"] = id
        animalDic["Name"] = name
        animalDic["Sex"] = sex
        animalDic["Type"] = type
        animalDic["Age"] = age
        animalDic["Variety"] = variety
        animalDic["Note"] = note
        animalDic["ImageName"] = imageName
        let dic = animalDic as NSDictionary
        return dic
    }

    
}

