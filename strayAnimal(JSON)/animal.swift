import Foundation

struct Strayanimal: Decodable {
    let id: Int?
    let kind: String?
    let sex: String?
    let age: String?
    let imageName: String?
    let shelterName: String?
    let shelterAddress: String?
    
    init(json: [String: Any]) {
        id = json["animal_id"] as? Int
        sex = json["animal_sex"] as? String
        kind = json["animal_kind"] as? String
        age = json["animal_age"] as? String
        imageName = json["album_file"] as? String
        shelterName = json["shelter_name"] as? String
        shelterAddress = json["shelter_address"] as? String
    }
    
}

