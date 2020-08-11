import Foundation

// Qiita API https://qiita.com/api/v2/docs#get-apiv2items
struct Article: Codable {
    
    var renderedBody: String
    var body: String
    var coediting: Bool
    var commentsCount: Int
    var createdAt: String
    var group: Group?
    var id: String
    var likesCount: Int
    var isPrivate: Bool
    var reactionsCount: Int
    var tags: [Tag]
    var title: String
    var updatedAt: String
    var url: String
    var user: User?
    var pageViewsCount: String?
    
    enum CodingKeys: String, CodingKey {
        case renderedBody = "rendered_body"
        case body
        case coediting
        case commentsCount = "comments_count"
        case createdAt = "created_at"
        case group
        case id
        case likesCount = "likes_count"
        case isPrivate = "private"
        case reactionsCount = "reactions_count"
        case tags
        case title
        case updatedAt = "updated_at"
        case url
        case user
        case pageViewsCount = "page_views_count"
    }
    
    struct Group: Codable {
        var createdAt: Date
        var id: Int
        var name: String
        var isPrivate: Bool
        var updatedAt: String
        var urlName: String
        
        enum CodingKeys: String, CodingKey {
            case createdAt = "created_at"
            case id
            case name
            case isPrivate = "private"
            case updatedAt = "updated_at"
            case urlName = "url_name"
        }
    }
    
    struct Tag: Codable {
        var name: String
        var versions: [String]
    }
    
    struct User: Codable {
        var description: String?
        var facebookId: String?
        var followeesCount: Int
        var followersCount: Int
        var githubLoginName: String?
        var id: String
        var itemsCount: Int
        var linkedinId: String?
        var location: String?
        var name: String
        var organization: String?
        var permanentId: Int
        var profileImageUrl: String
        var teamOnly: Bool
        var twitterScreenName: String?
        var websiteUrl: String?
        
        enum CodingKeys: String, CodingKey {
            case description
            case facebookId = "facebook_id"
            case followeesCount = "followees_count"
            case followersCount = "followers_count"
            case githubLoginName = "github_login_name"
            case id
            case itemsCount = "items_count"
            case linkedinId = "linkedin_id"
            case location
            case name
            case organization
            case permanentId = "permanent_id"
            case profileImageUrl = "profile_image_url"
            case teamOnly = "team_only"
            case twitterScreenName = "twitter_screen_name"
            case websiteUrl = "website_url"
        }
    }
}

extension Article {
    var changedCreatedAt: String {
        return changeDate(self.createdAt)
    }
    var changedUpdateAt: String {
        return changeDate(self.updatedAt)
    }
    
    func changeDate(_ createdAt: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssXXX"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        let date = formatter.date(from: createdAt)!
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
        let str = formatter.string(from: date)
        return str
    }
}
