//
//  DataStruct.swift
//  RedditReader
//
//  Created by Kenneth Wieschhoff on 12/21/20.
//

import Foundation

struct ChildrenData: Codable {
    var thumbnail: String?
    var title: String?
    var num_comments: Int?
    var score: Int?
}
struct Children: Codable {
    var kind: String?
    var data: ChildrenData?
}
struct DataStruct: Codable {
    var children: [Children]?
    var after: String?
}

struct Entry: Codable {
    var kind: String?
    var data: DataStruct?
}

