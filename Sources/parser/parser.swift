import Foundation
import XMLCoder

struct OwnerInfo: Decodable, Equatable {
    var sigunguCd: Int

    enum CodingKeys: String, CodingKey {
        case sigunguCd = "sigungu_cd"
    }
}

class Parser {
    var text = "Hello, World!"

    func parse(_ jsonString: String) -> OwnerInfo {
        let data = jsonString.data(using: .utf8)!
        let ownerInfo: OwnerInfo = try! JSONDecoder().decode(OwnerInfo.self, from: data)
        return ownerInfo
    }

    func parseXml(_ xmlString: String) -> OwnerInfo {
        let data = xmlString.data(using: .utf8)!
        let ownerInfo: OwnerInfo = try! XMLDecoder().decode(OwnerInfo.self, from: data)
        return ownerInfo
    }
}
