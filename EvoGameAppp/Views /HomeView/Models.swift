//
//  DataStruct.swift
//  EvoGameAppp
//
//  Created by sixpep on 25/03/23.
//

import UIKit

struct OnboardingSlide{
    let title:String
    let description:String
    let image:UIImage
}

struct featuredApiResponse: Codable {
    let Featured: [featured]?

    enum CodingKeys: String, CodingKey {
        case Featured
    }
}

// MARK: - Featured
struct featured: Codable {
    let Id, AppName, Category, Language: String?
    let Author, Description, LastUpdated: String?
    let Icon, CoverImage, Screenshot1, Screenshot2: String?
    let Screenshot3, Screenshot4: String?
    let VideoLink, Featured, Recomended: String?

    enum CodingKeys: String, CodingKey {
        case Id
        case AppName
        case Category
        case Language
        case Author
        case Description
        case LastUpdated
        case Icon
        case CoverImage
        case Screenshot1
        case Screenshot2
        case Screenshot3
        case Screenshot4
        case VideoLink
        case Featured
        case Recomended
    }
}

struct RecommendedApiResponse: Codable {
    let Recomended: [recomended]?

    enum CodingKeys: String, CodingKey {
        case Recomended
    }
}

// MARK: - Recomended
struct recomended: Codable {
    let Id, AppName, Category, Language: String?
    let Author, Description, LastUpdated: String?
    let Icon, CoverImage, Screenshot1, Screenshot2: String?
    let Screenshot3, Screenshot4: String?
    let VideoLink, Featured, Recomended: String?

    enum CodingKeys: String, CodingKey {
        case Id
        case AppName
        case Category
        case Language
        case Author
        case Description
        case LastUpdated
        case Icon
        case CoverImage
        case Screenshot1
        case Screenshot2
        case Screenshot3
        case Screenshot4
        case VideoLink
        case Featured
        case Recomended
    }
}


typealias Welcome = [String]

struct CategoryApiResponse: Codable {
    let Category: [categoryElement]?

    enum CodingKeys: String, CodingKey {
        case Category
    }
}

// MARK: - CategoryElement
struct categoryElement: Codable {
    let Id, AppName: String?
    let Category: String?
    let Language: String?
    let Author, Description: String?
    let LastUpdated: String?
    let Icon, CoverImage, Screenshot1, Screenshot2: String?
    let Screenshot3, Screenshot4: String?
    let VideoLink, Featured, Recomended, AndroidPackageName: String?
    let AndroidStoreLink: String?
    let AndroidSupportVersion, AndroidSize, AndroidVersion, AndroidRatings: String?
    let AndroidINR, AndroidInstallCount, AndroidRemarks: String?

    enum CodingKeys: String, CodingKey {
        case Id
        case AppName
        case Category
        case Language
        case Author
        case Description
        case LastUpdated
        case Icon
        case CoverImage
        case Screenshot1
        case Screenshot2
        case Screenshot3
        case Screenshot4
        case VideoLink
        case Featured
        case Recomended
        case AndroidPackageName
        case AndroidStoreLink
        case AndroidSupportVersion
        case AndroidSize
        case AndroidVersion
        case AndroidRatings
        case AndroidINR
        case AndroidInstallCount
        case AndroidRemarks
    }
}
struct searchApiResponse: Codable {
    let Search: [search]?

    enum CodingKeys: String, CodingKey {
        case Search
    }
}

// MARK: - Search
struct search: Codable {
    let Id, AppName, Category, Language: String?
    let Author, Description, LastUpdated: String?
    let Icon, CoverImage, Screenshot1, Screenshot2: String?
    let Screenshot3, Screenshot4: String?
    let VideoLink, Featured, Recomended: String?
    let IosID, IosPackageName, IosStoreLink, IosSupportVersion: String?
    let IosSize, IosVersion, IosRatings, IosINR: String?
    let IosInstallCount: String?
    let IosRemarks: String?

    enum CodingKeys: String, CodingKey {
        case Id
        case AppName
        case Category
        case Language
        case Author
        case Description
        case LastUpdated
        case Icon
        case CoverImage
        case Screenshot1
        case Screenshot2
        case Screenshot3
        case Screenshot4
        case VideoLink
        case Featured
        case Recomended
        case IosID
        case IosPackageName
        case IosStoreLink
        case IosSupportVersion
        case IosSize
        case IosVersion
        case IosRatings
        case IosINR
        case IosInstallCount
        case IosRemarks
    }
}
