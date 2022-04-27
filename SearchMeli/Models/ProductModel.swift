//
//  ProductoDetailResponse.swift
//  SearchMeli
//
//  Created by Julian Ramos on 4/26/22.
//

import Foundation


// MARK: - ProductDetailResponse
struct ProductModel: Codable {
    let id, siteID, title: String?
    let subtitle: String?
    let sellerID: Int
    let categoryID: String
    let price, basePrice: Int
    let originalPrice: StringOrInt?
    let currencyID: String
    let initialQuantity, availableQuantity, soldQuantity: Int
    let saleTerms: [Attribute]
    let buyingMode, listingTypeID, startTime, stopTime: String
    let condition: String
    let permalink: String
    let thumbnailID: String
    let thumbnail: String
    let secureThumbnail: String
    let pictures: [Picture]
    let videoID: String?
    let descriptions: [String]
    let acceptsMercadopago: Bool
    let nonMercadoPagoPaymentMethods: [String]
    let shipping: Shipping
    let internationalDeliveryMode: String
    let sellerAddress: SellerAddress
//    let sellerContact: String?
    let location: Location
    let coverageAreas: [String]
    let attributes: [Attribute]
    let warnings: [String]
    let listingSource: String
//    let variations: [String]
    let status: String
    let subStatus: [String]
    let tags: [String]
    let warranty, domainID: String?
    let parentItemID, differentialPricing: String?
    let dealIDS: [String]
    let automaticRelist: Bool
    let dateCreated, lastUpdated: String?
    let catalogListing: Bool?
    let channels: [String]

    enum CodingKeys: String, CodingKey {
        case id
        case siteID = "site_id"
        case title, subtitle
        case sellerID = "seller_id"
        case categoryID = "category_id"
        case price
        case basePrice = "base_price"
        case originalPrice = "original_price"
        case currencyID = "currency_id"
        case initialQuantity = "initial_quantity"
        case availableQuantity = "available_quantity"
        case soldQuantity = "sold_quantity"
        case saleTerms = "sale_terms"
        case buyingMode = "buying_mode"
        case listingTypeID = "listing_type_id"
        case startTime = "start_time"
        case stopTime = "stop_time"
        case condition, permalink
        case thumbnailID = "thumbnail_id"
        case thumbnail
        case secureThumbnail = "secure_thumbnail"
        case pictures
        case videoID = "video_id"
        case descriptions
        case acceptsMercadopago = "accepts_mercadopago"
        case nonMercadoPagoPaymentMethods = "non_mercado_pago_payment_methods"
        case shipping
        case internationalDeliveryMode = "international_delivery_mode"
        case sellerAddress = "seller_address"
//        case sellerContact = "seller_contact"
        case location
        case coverageAreas = "coverage_areas"
        case attributes, warnings
        case listingSource = "listing_source"
//        case variations
        case status
        case subStatus = "sub_status"
        case tags, warranty
        case domainID = "domain_id"
        case parentItemID = "parent_item_id"
        case differentialPricing = "differential_pricing"
        case dealIDS = "deal_ids"
        case automaticRelist = "automatic_relist"
        case dateCreated = "date_created"
        case lastUpdated = "last_updated"
       
        case catalogListing = "catalog_listing"
        case channels
    }
}


// MARK: - Location
struct Location: Codable {
}

// MARK: - Picture
struct Picture: Codable {
    let id: String
    let url: String
    let secureURL: String
    let size, maxSize, quality: String

    enum CodingKeys: String, CodingKey {
        case id, url
        case secureURL = "secure_url"
        case size
        case maxSize = "max_size"
        case quality
    }
}
