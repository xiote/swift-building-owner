import Foundation

struct Response: Codable, Equatable {
    let header: Header
    let body: Body
}

struct Header: Codable, Equatable {
    let resultCode: String
    let resultMsg: String
}

struct Body: Codable, Equatable {
    let numOfRows: Int
    let pageNo: Int
    let totalCount: Int
    let items: Items
}

struct Items: Codable, Equatable {
    let item: [Item]
}

typealias OwnerInfo = Item
struct Item: Codable, Equatable {
    let sigunguCd: Int

    enum CodingKeys: String, CodingKey {
        case sigunguCd = "sigungu_cd"
    }
}
