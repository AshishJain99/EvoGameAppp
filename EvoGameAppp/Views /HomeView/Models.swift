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


struct RecommendedApiResponse: Codable {
    let Recommended: [Recommended]?

    enum CodingKeys: String, CodingKey {
        case Recommended = "Recommended"
    }
}

// MARK: - Recommended
struct Recommended: Codable {
    let Id, AppName, Category, Language: String?
    let Author, Description: String?
    let LastUpdated: String?
    let Icon: String?
    let CoverImage, Screenshot1, Screenshot2, Screenshot3: String?
    let Screenshot4: String?
    let VideoLink, Featured, Recomended, IosID: String?
    let IosPackageName: String?
    let IosStoreLink: String?
    let IosSupportVersion, IosSize, IosVersion, IosRatings: String?
    let IosINR: String?
    let IosInstallCount: String?
    let IosRemarks: String?

    enum CodingKeys: String, CodingKey {
        case Id = "Id"
        case AppName = "AppName"
        case Category = "Category"
        case Language = "Language"
        case Author = "Author"
        case Description = "Description"
        case LastUpdated = "LastUpdated"
        case Icon = "Icon"
        case CoverImage = "CoverImage"
        case Screenshot1 = "Screenshot1"
        case Screenshot2 = "Screenshot2"
        case Screenshot3 = "Screenshot3"
        case Screenshot4 = "Screenshot4"
        case VideoLink = "VideoLink"
        case Featured = "Featured"
        case Recomended = "Recomended"
        case IosID = "IosId"
        case IosPackageName = "IosPackageName"
        case IosStoreLink = "IosStoreLink"
        case IosSupportVersion = "IosSupportVersion"
        case IosSize = "IosSize"
        case IosVersion = "IosVersion"
        case IosRatings = "IosRatings"
        case IosINR = "IosINR"
        case IosInstallCount = "IosInstallCount"
        case IosRemarks = "IosRemarks"
    }
}


typealias Welcome = [String]


struct CategoryApiResponse: Codable {
    let Category: [categoryElement]?

    enum CodingKeys: String, CodingKey {
        case Category = "Category"
    }
}

// MARK: - CategoryElement
struct categoryElement: Codable {
    let Id, AppName: String?
    let Category: String?
    let Language, Author, Description: String?
    let LastUpdated: String?
    let Icon: String?
    let CoverImage, Screenshot1, Screenshot2, Screenshot3: String?
    let Screenshot4: String?
    let VideoLink, Featured, Recomended, IosID: String?
    let IosPackageName: String?
    let IosStoreLink: String?
    let IosSupportVersion, IosSize, IosVersion, IosRatings: String?
    let IosINR: String?
    let IosInstallCount: String?
    let IosRemarks: String?

    enum CodingKeys: String, CodingKey {
        case Id = "Id"
        case AppName = "AppName"
        case Category = "Category"
        case Language = "Language"
        case Author = "Author"
        case Description = "Description"
        case LastUpdated = "LastUpdated"
        case Icon = "Icon"
        case CoverImage = "CoverImage"
        case Screenshot1 = "Screenshot1"
        case Screenshot2 = "Screenshot2"
        case Screenshot3 = "Screenshot3"
        case Screenshot4 = "Screenshot4"
        case VideoLink = "VideoLink"
        case Featured = "Featured"
        case Recomended = "Recomended"
        case IosID = "IosId"
        case IosPackageName = "IosPackageName"
        case IosStoreLink = "IosStoreLink"
        case IosSupportVersion = "IosSupportVersion"
        case IosSize = "IosSize"
        case IosVersion = "IosVersion"
        case IosRatings = "IosRatings"
        case IosINR = "IosINR"
        case IosInstallCount = "IosInstallCount"
        case IosRemarks = "IosRemarks"
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
struct featuredApiResponse: Codable {
    let Featured: [Featured]?

    enum CodingKeys: String, CodingKey {
        case Featured = "Featured"
    }
}

// MARK: - Featured
struct Featured: Codable {
    let Id, AppName, Category, Language: String?
    let Author, Description: String?
    let LastUpdated: String?
    let Icon: String?
    let CoverImage, Screenshot1, Screenshot2, Screenshot3: String?
    let Screenshot4: String?
    let VideoLink, Featured, Recomended, IosID: String?
    let IosPackageName: String?
    let IosStoreLink: String?
    let IosSupportVersion, IosSize, IosVersion, IosRatings: String?
    let IosINR: String?
    let IosInstallCount: String?
    let IosRemarks: String?

    enum CodingKeys: String, CodingKey {
        case Id = "Id"
        case AppName = "AppName"
        case Category = "Category"
        case Language = "Language"
        case Author = "Author"
        case Description = "Description"
        case LastUpdated = "LastUpdated"
        case Icon = "Icon"
        case CoverImage = "CoverImage"
        case Screenshot1 = "Screenshot1"
        case Screenshot2 = "Screenshot2"
        case Screenshot3 = "Screenshot3"
        case Screenshot4 = "Screenshot4"
        case VideoLink = "VideoLink"
        case Featured = "Featured"
        case Recomended = "Recomended"
        case IosID = "IosId"
        case IosPackageName = "IosPackageName"
        case IosStoreLink = "IosStoreLink"
        case IosSupportVersion = "IosSupportVersion"
        case IosSize = "IosSize"
        case IosVersion = "IosVersion"
        case IosRatings = "IosRatings"
        case IosINR = "IosINR"
        case IosInstallCount = "IosInstallCount"
        case IosRemarks = "IosRemarks"
    }
}

struct searchResponseApi: Codable {
    let Search: [Search]?

    enum CodingKeys: String, CodingKey {
        case Search = "Search"
    }
}

// MARK: - Search
struct Search: Codable {
    let Id, AppName, Category, Language: String?
    let Author, Description: String?
    let LastUpdated: String?
    let Icon: String?
    let CoverImage, Screenshot1, Screenshot2, Screenshot3: String?
    let Screenshot4: String?
    let VideoLink, Featured, Recomended, IosID: String?
    let IosPackageName: String?
    let IosStoreLink: String?
    let IosSupportVersion, IosSize, IosVersion, IosRatings: String?
    let IosINR, IosInstallCount, IosRemarks: String?

    enum CodingKeys: String, CodingKey {
        case Id = "Id"
        case AppName = "AppName"
        case Category = "Category"
        case Language = "Language"
        case Author = "Author"
        case Description = "Description"
        case LastUpdated = "LastUpdated"
        case Icon = "Icon"
        case CoverImage = "CoverImage"
        case Screenshot1 = "Screenshot1"
        case Screenshot2 = "Screenshot2"
        case Screenshot3 = "Screenshot3"
        case Screenshot4 = "Screenshot4"
        case VideoLink = "VideoLink"
        case Featured = "Featured"
        case Recomended = "Recomended"
        case IosID = "IosId"
        case IosPackageName = "IosPackageName"
        case IosStoreLink = "IosStoreLink"
        case IosSupportVersion = "IosSupportVersion"
        case IosSize = "IosSize"
        case IosVersion = "IosVersion"
        case IosRatings = "IosRatings"
        case IosINR = "IosINR"
        case IosInstallCount = "IosInstallCount"
        case IosRemarks = "IosRemarks"
    }
}
