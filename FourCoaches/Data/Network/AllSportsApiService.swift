//
//  AllSprotsApiService.swift
//  FourCoaches
//
//  Created by Hamed Mohamed on 05/05/2023.
//

import Foundation


//MARK: - AllSportsApiServiceDefault
final class AllSportsApiServiceDefault :AllSportsApiService {
    private let urlSession:URLSession!
    private init(urlSession: URLSession!) {
        self.urlSession = urlSession
    }
    
    static func getAllSportsApiServiceInstance(urlSession: URLSession) -> AllSportsApiServiceDefault {
        return AllSportsApiServiceDefault(urlSession: urlSession)
    }
    
    private func getURL(baseUrl:String,spotType:SportType, key:String, met:String) -> String{
         return baseUrl.appending(spotType.rawValue).appending("?met=\(met)").appending("&APIkey=\(key)")
     }
    
}

//MARK: - getLeagueTeamsScores
extension AllSportsApiServiceDefault {
    func getTennisPlayerByLeagueId(leagueID: String, completion: @escaping (Result<TennisPlayers, Error>) -> Void)  {
        let urlRequrst =  URLRequest(url: (URL(string: getURL(baseUrl: Constanst.ALL_SPOSRTS_API_BASE_URL, spotType: SportType.TENNIS, key: Constanst.ALL_SPOSRTS_API_USER_KEY, met: MetTypes.PLAYERS.rawValue).appending("&leagueId=\(leagueID)")))!)
         getURLTask(urlRequest: urlRequrst, completion: completion).resume()
    }
}


//MARK: - getLeagueTeamsScores
extension AllSportsApiServiceDefault {
    func getLeagueTeamsScores(sportType: SportType, leagueID: String, completion: @escaping (Result<LeagueTeams, Error>) -> Void) {
        let urlRequrst =  URLRequest(url: (URL(string: getURL(baseUrl: Constanst.ALL_SPOSRTS_API_BASE_URL, spotType: sportType, key: Constanst.ALL_SPOSRTS_API_USER_KEY, met: MetTypes.TEAMS.rawValue).appending("&leagueId=\(leagueID)")))!)
         getURLTask(urlRequest: urlRequrst, completion: completion).resume()
    }
}


//MARK: - getLeagues
extension AllSportsApiServiceDefault {
  func getLeagues(completion: @escaping (Result<Leagues, Error>) -> Void, sportType:SportType) {
      var urlRequrst =  URLRequest(url: URL(string: getURL(baseUrl: Constanst.ALL_SPOSRTS_API_BASE_URL, spotType: sportType, key: Constanst.ALL_SPOSRTS_API_USER_KEY, met: MetTypes.LEAGUES.rawValue))!)
       getURLTask(urlRequest: urlRequrst, completion: completion).resume()
    }
}


//MARK: - getFixtureScores
extension AllSportsApiServiceDefault {
    func getFixtureScores<D:Decodable>(sportType:SportType,leagueID:String,completion: @escaping (Result<D, Error>) -> Void) {
        let urlRequrst =  URLRequest(url: (URL(string: getURL(baseUrl: Constanst.ALL_SPOSRTS_API_BASE_URL, spotType: sportType, key: Constanst.ALL_SPOSRTS_API_USER_KEY, met: MetTypes.FIXTURE.rawValue).appending("&leagueId=\(leagueID)").appending("&from=\(DateMapper.getCurrentDate())").appending("&to=\(DateMapper.geDateAfterDayes(dayCount: 10))")))!)
         getURLTask(urlRequest: urlRequrst, completion: completion).resume()
    }
}

//MARK: - getLiveScoreScores
extension AllSportsApiServiceDefault{
    func getLiveScoreScores<D:Decodable>(sportType: SportType, leagueID: String, completion: @escaping (Result<D, Error>) -> Void) {
        let urlRequrst =  URLRequest(url: (URL(string: getURL(baseUrl: Constanst.ALL_SPOSRTS_API_BASE_URL, spotType: sportType, key: Constanst.ALL_SPOSRTS_API_USER_KEY, met: MetTypes.LIVE_SCORE.rawValue).appending("&leagueId=\(leagueID)")))!)
         getURLTask(urlRequest: urlRequrst, completion: completion).resume()
    }
}


//MARK: - getURLTask
extension AllSportsApiServiceDefault{
    private func getURLTask<T:Decodable>(urlRequest:URLRequest,completion:@escaping(Result<T,Error>) -> Void) -> URLSessionDataTask{
        return urlSession.dataTask(with: urlRequest) { data, urlResponse, error in
            if let dataTaskError = error {
                completion(Result.failure(dataTaskError))
            }else{
                do{
                    let encodedData = try JSONDecoder().decode(T.self, from: data!)
                    completion(Result.success(encodedData))
                }catch let encodingError{
                    completion(Result.failure(encodingError))
                }
            }
        }
    }
}








