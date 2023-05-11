//
//  MockAllSportsApiServiceTests.swift
//  FourCoachesTests
//
//  Created by Hamed Mohamed on 10/05/2023.
//

import XCTest
@testable import FourCoaches

final class MockAllSportsApiServiceTests: XCTestCase {

    private var allSportsApiServiec:AllSportsApiService?
    
    override func setUpWithError() throws {
        allSportsApiServiec = MockAllSportsApiService()
    }

    override func tearDownWithError() throws {
        allSportsApiServiec = nil
    }

    func testGetRemoteLeaguesWithStableInternetConnection() throws {

        allSportsApiServiec?.getLeagues(completion: { result in
            switch result {
            case .success(let matchList):
                //When
                let result = (matchList.result?.count != 0)
                //Then
                XCTAssertTrue(result)
                                       
            case .failure(let er):
                XCTFail(er.localizedDescription)
            }
        }, sportType: SportType.FOOTBALL)
        
    }
    

    
    func testGetRemoteFootballLiveScoreWithStableInternetConnection() throws {

        allSportsApiServiec?.getLiveScoreScores(sportType: SportType.FOOTBALL, leagueID: "", completion: { (result : Result<FootballFixture,Error>) in
            switch result {
            case .success(let matchList):
                //When
                let result = (matchList.result?.count != 0)
                //Then
                XCTAssertTrue(result)
        
            case .failure(let er):
                XCTFail(er.localizedDescription)
            }
        })
        
    }
    
    
    func testGetRemoteFootballFixtureWithStableInternetConnection() throws {

        allSportsApiServiec?.getFixtureScores(sportType: SportType.FOOTBALL, leagueID: "", completion: { (result : Result<FootballFixture,Error>) in
            switch result {
            case .success(let matchList):
                //When
                let result = (matchList.result?.count != 0)
                //Then
                XCTAssertTrue(result)
            case .failure(let er):
                XCTFail(er.localizedDescription)
            }
        })

        
    }
    
    
    func testGetRemoteFootballTeamsWithStableInternetConnection() throws {

        allSportsApiServiec?.getLeagueTeamsScores(sportType: SportType.FOOTBALL, leagueID: "", completion: { (result : Result<LeagueTeams,Error>) in
            switch result {
            case .success(let matchList):
                //When
                let result = (matchList.result?.count != 0)
                //Then
                XCTAssertTrue(result)
                                       
            case .failure(let er):
                XCTFail(er.localizedDescription)
            }
        })

        
    }
    
    func testGetRemoteTennisPlayersWithStableInternetConnection() throws {

        allSportsApiServiec?.getTennisPlayerByLeagueId( leagueID: "", completion: { (result : Result<TennisPlayers,Error>) in
            switch result {
            case .success(let matchList):
                //When
                let result = (matchList.result?.count != 0)
                //Then
                XCTAssertTrue(result)
                                       
            case .failure(let er):
                XCTFail(er.localizedDescription)
            }
        })
        
    }
    
    

}
