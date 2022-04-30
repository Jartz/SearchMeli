//
//  ProductModel.swift
//  SearchMeli
//
//  Created by Julian Ramos on 4/26/22.
//

import Foundation

// MARK: - ProductResponse
struct ProductResponse: Codable {
    let siteID: String
    let countryDefaultTimeZone, query: String
    let paging: Paging
    let results: [Result]?
    let sort: Sort
    let availableSorts: [Sort]
    let filters: [Filter]
    let availableFilters: [AvailableFilter]

    enum CodingKeys: String, CodingKey {
        case siteID = "site_id"
        case countryDefaultTimeZone = "country_default_time_zone"
        case query, paging, results, sort
        case availableSorts = "available_sorts"
        case filters
        case availableFilters = "available_filters"
    }
}

// MARK: - AvailableFilter
struct AvailableFilter: Codable {
    let id, name, type: String?
    let values: [AvailableFilterValue]
}

// MARK: - AvailableFilterValue
struct AvailableFilterValue: Codable {
    let id, name: String?
    let results: Int?
}

// MARK: - Sort
struct Sort: Codable {
    let id, name: String?
}

// MARK: - Filter
struct Filter: Codable {
    let id, name, type: String?
    let values: [FilterValue]?
}

// MARK: - FilterValue
struct FilterValue: Codable {
    let id, name: String?
    let pathFromRoot: [Sort]?

    enum CodingKeys: String, CodingKey {
        case id, name
        case pathFromRoot = "path_from_root"
    }
}

// MARK: - Paging
struct Paging: Codable {
    let total, primaryResults, offset, limit: Int

    enum CodingKeys: String, CodingKey {
        case total
        case primaryResults = "primary_results"
        case offset, limit
    }
}

// MARK: - Result
struct Result: Codable {
    let id: String?
    let siteID: String?
    let title: String?
    let seller: Seller?
    let price: Int?
    let prices: Prices?
    let salePrice: String?
    let currencyID: String?
    let availableQuantity, soldQuantity: Int?
    let buyingMode: String?
    let listingTypeID: String?
    let stopTime: String?
    let condition: String?
    let permalink: String?
    let thumbnail: String?
    let thumbnailID: String?
    let acceptsMercadopago: Bool?
    let installments: Installments?
    let address: Address?
    let shipping: Shipping?
    let sellerAddress: SellerAddress?
    let attributes: [Attribute]
    let originalPrice: Int?
    let categoryID: String?
    let domainID: String?
    let catalogProductID: String?
    let tags: [String]
    let orderBackend: Int?
    let useThumbnailID: Bool?
    let offerScore, offerShare, matchScore, winnerItemID: JSONNull?
    let melicoin, discounts: JSONNull?
    let differentialPricing: DifferentialPricing?

    enum CodingKeys: String, CodingKey {
        case id
        case siteID = "site_id"
        case title, seller, price, prices
        case salePrice = "sale_price"
        case currencyID = "currency_id"
        case availableQuantity = "available_quantity"
        case soldQuantity = "sold_quantity"
        case buyingMode = "buying_mode"
        case listingTypeID = "listing_type_id"
        case stopTime = "stop_time"
        case condition, permalink, thumbnail
        case thumbnailID = "thumbnail_id"
        case acceptsMercadopago = "accepts_mercadopago"
        case installments, address, shipping
        case sellerAddress = "seller_address"
        case attributes
        case originalPrice = "original_price"
        case categoryID = "category_id"
       
        case domainID = "domain_id"
        case catalogProductID = "catalog_product_id"
        case tags
        case orderBackend = "order_backend"
        case useThumbnailID = "use_thumbnail_id"
        case offerScore = "offer_score"
        case offerShare = "offer_share"
        case matchScore = "match_score"
        case winnerItemID = "winner_item_id"
        case melicoin, discounts
        case differentialPricing = "differential_pricing"
    }
}

// MARK: - Address
struct Address: Codable {
    let stateID: String?
    let stateName: String?
    let cityID, cityName: String?

    enum CodingKeys: String, CodingKey {
        case stateID = "state_id"
        case stateName = "state_name"
        case cityID = "city_id"
        case cityName = "city_name"
    }
}


enum StateName: String, Codable {
    case antioquia = "Antioquia"
    case bogotáDC = "Bogotá D.C."
    case cundinamarca = "Cundinamarca"
    case valleDelCauca = "Valle Del Cauca"
}

// MARK: - Attribute
struct Attribute: Codable {
    let id: String?
    let name: String?
    let valueStruct: Struct?
    let values: [AttributeValue]
    let attributeGroupID: String?
    let valueID, valueName: String?
    let attributeGroupName: String?
    let source: Int?

    enum CodingKeys: String, CodingKey {
        case id, name
        case valueStruct = "value_struct"
        case values
        case attributeGroupID = "attribute_group_id"
        case valueID = "value_id"
        case valueName = "value_name"
        case attributeGroupName = "attribute_group_name"
        case source
    }
}

enum AttributeGroupID: String, Codable {
    case others = "OTHERS"
}

enum AttributeGroupName: String, Codable {
    case otros = "Otros"
}
// MARK: - Struct
struct Struct: Codable {
    let number: Double?
    let unit: String?
}
// MARK: - AttributeValue
struct AttributeValue: Codable {
    let valueStruct: Struct?
    let source: Int?
    let id, name: String?

    enum CodingKeys: String, CodingKey {
        case valueStruct = "struct"
        case source, id, name
    }
}
enum Condition: String, Codable {
    case new = "new"
}
// MARK: - DifferentialPricing
struct DifferentialPricing: Codable {
    let id: Int?
}

// MARK: - Installments
struct Installments: Codable {
    let quantity: Int?
    let amount: Double?
    let rate: Int?
    let currencyID: String?

    enum CodingKeys: String, CodingKey {
        case quantity, amount, rate
        case currencyID = "currency_id"
    }
}



// MARK: - Prices
struct Prices: Codable {
    let id: String?
    let prices: [Price]
    let presentation: Presentation
    let paymentMethodPrices: [JSONAny]
    let referencePrices: [ReferencePrice]
    let purchaseDiscounts: [JSONAny]

    enum CodingKeys: String, CodingKey {
        case id, prices, presentation
        case paymentMethodPrices = "payment_method_prices"
        case referencePrices = "reference_prices"
        case purchaseDiscounts = "purchase_discounts"
    }
}

// MARK: - Presentation
struct Presentation: Codable {
    let displayCurrency: String?

    enum CodingKeys: String, CodingKey {
        case displayCurrency = "display_currency"
    }
}

// MARK: - Price
struct Price: Codable {
    let id: String?
    let type: PriceType
    let amount: Amount?
//    let regularAmount: Int?
    let currencyID: String?
//    let lastUpdated: Date?
    let conditions: Conditions
    let exchangeRateContext: String?
    let metadata: Metadata

    enum CodingKeys: String, CodingKey {
        case id, type, amount
//        case regularAmount = "regular_amount"
        case currencyID = "currency_id"
//        case lastUpdated = "last_updated"
        case conditions
        case exchangeRateContext = "exchange_rate_context"
        case metadata
    }
}

@propertyWrapper struct Flexible<T: FlexibleDecodable>: Decodable {
    var wrappedValue: T
    
    init(from decoder: Decoder) throws {
        wrappedValue = try T(container: decoder.singleValueContainer())
    }
}

protocol FlexibleDecodable {
    init(container: SingleValueDecodingContainer) throws
}

extension Int: FlexibleDecodable {
    init(container: SingleValueDecodingContainer) throws {
        if let int = try? container.decode(Int.self) {
            self = int
        } else if let string = try? container.decode(String.self), let int = Int(string) {
            self = int
        } else {
            throw DecodingError.dataCorrupted(.init(codingPath: container.codingPath, debugDescription: "Invalid int value"))
        }
    }
}

// MARK: - Conditions
struct Conditions: Codable {
    let contextRestrictions: [String?]
//    let startTime,
//let endTime: Date?
    let eligible: Bool?

    enum CodingKeys: String, CodingKey {
        case contextRestrictions = "context_restrictions"
//        case startTime = "start_time"
//        case endTime = "end_time"
        case eligible
    }
}





// MARK: - Metadata
struct Metadata: Codable {
    let campaignID: String?
    let promotionID: String?
    let promotionType: String?

    enum CodingKeys: String, CodingKey {
        case campaignID = "campaign_id"
        case promotionID = "promotion_id"
        case promotionType = "promotion_type"
    }
}

enum PriceType: String, Codable {
    case promotion = "promotion"
    case standard = "standard"
}

// MARK: - ReferencePrice
struct ReferencePrice: Codable {
    let id: String?
    let type: String?
    let conditions: Conditions
    let amount: Amount?
    let currencyID: String?
    let exchangeRateContext: String?
//    let tags: Any
//    let lastUpdated: Date?

    enum CodingKeys: String, CodingKey {
        case id, type, conditions, amount
        case currencyID = "currency_id"
        case exchangeRateContext = "exchange_rate_context"
//        case tags
//        case lastUpdated = "last_updated"
    }
}

enum Amount: Codable {
    case integer(Int)
    case double(Double)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(Double.self) {
            self = .double(x)
            return
        }
        throw DecodingError.typeMismatch(Amount.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Amount"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .double(let x):
            try container.encode(x)
        }
    }
}


// MARK: - Seller
struct Seller: Codable {
    let id: Int?
    let permalink, registrationDate: String?
    let carDealer, realEstateAgency: Bool?
//    let tags: String?

    enum CodingKeys: String, CodingKey {
        case id, permalink
        case registrationDate = "registration_date"
        case carDealer = "car_dealer"
        case realEstateAgency = "real_estate_agency"
//        case tags
    }
}

// MARK: - SellerAddress
struct SellerAddress: Codable {
    let id: StringOrInt?
    let comment, addressLine, zipCode: String?
    let country, state, city: Sort
    let latitude, longitude: String?

    enum CodingKeys: String, CodingKey {
        case id, comment
        case addressLine = "address_line"
        case zipCode = "zip_code"
        case country, state, city, latitude, longitude
    }
}

enum StringOrInt: Codable {
    case integer(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Amount.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Amount"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

// MARK: - Shipping
struct Shipping: Codable {
    let freeShipping: Bool
    let mode: String?
    let tags: [String]
    let logisticType: String?
    let storePickUp: Bool?

    enum CodingKeys: String, CodingKey {
        case freeShipping = "free_shipping"
        case mode, tags
        case logisticType = "logistic_type"
        case storePickUp = "store_pick_up"
    }
}








// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public func hash(into hasher: inout Hasher) {
            hasher.combine(0)
    }
    
    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}

