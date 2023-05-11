//
//  FourCoachesTests.swift
//  FourCoachesTests
//
//  Created by Hamed Mohamed on 10/05/2023.
//

import XCTest
@testable import FourCoaches

final class AllSportsApiServiceDefaultTests: XCTestCase {
    
    
    private var allSportsApiServiec:AllSportsApiService?

    override func setUpWithError() throws {
        allSportsApiServiec = AllSportsApiServiceDefault.getAllSportsApiServiceInstance(urlSession: URLSession(configuration: URLSessionConfiguration.default))
    }

    override func tearDownWithError() throws {
        allSportsApiServiec = nil
    }

 
    func testGetRemoteLeaguesWithStableInternetConnection() throws {
        let expectationInstance = expectation(description: "wait until api gets result")
                guard allSportsApiServiec != nil else {
                    XCTFail("AllSportsApiService instance is nil referance")
                    return
                }

        allSportsApiServiec?.getLeagues(completion: { result in
            switch result {
            case .success(let matchList):
                //When
                let result = (matchList.result?.count != 0)
                //Then
                XCTAssertTrue(result)
                expectationInstance.fulfill()
                                       
            case .failure(let er):
                print(er)
            }
        }, sportType: SportType.TENNIS)
        waitForExpectations(timeout: 4)
        
    }
    
    func testGetRemoteLeaguesWithStableInternet() throws {
        let expectationInstance = expectation(description: "wait until api gets result")
                guard allSportsApiServiec != nil else {
                    XCTFail("AllSportsApiService instance is nil referance")
                    return
                }

        allSportsApiServiec?.getLeagues(completion: { result in
            switch result {
            case .success(let matchList):
                //When
                let result = (matchList.result?.count != 0)
                //Then
                XCTAssertTrue(result)
                expectationInstance.fulfill()
                                       
            case .failure(let er):
                print(er)
            }
        }, sportType: SportType.TENNIS)
        waitForExpectations(timeout: 4)
        
    }
    
    func testGetRemoteFootballLiveScoreWithStableInternetConnection() throws {
        let expectationInstance = expectation(description: "wait until api gets result")
                guard allSportsApiServiec != nil else {
                    XCTFail("AllSportsApiService instance is nil referance")
                    return
                }

        allSportsApiServiec?.getLiveScoreScores(sportType: SportType.FOOTBALL, leagueID: "", completion: { (result : Result<FootballFixture,Error>) in
            switch result {
            case .success(let matchList):
                //When
                let result = (matchList.result?.count != 0)
                //Then
                XCTAssertTrue(result)
                expectationInstance.fulfill()
                                       
            case .failure(let er):
                print(er)
            }
        })
        waitForExpectations(timeout: 4)
        
    }
    
    
    func testGetRemoteFootballFixtureWithStableInternetConnection() throws {
        let expectationInstance = expectation(description: "wait until api gets result")
                guard allSportsApiServiec != nil else {
                    XCTFail("AllSportsApiService instance is nil referance")
                    return
                }

        allSportsApiServiec?.getFixtureScores(sportType: SportType.FOOTBALL, leagueID: "", completion: { (result : Result<FootballFixture,Error>) in
            switch result {
            case .success(let matchList):
                //When
                let result = (matchList.result?.count != 0)
                //Then
                XCTAssertTrue(result)
                expectationInstance.fulfill()
                                       
            case .failure(let er):
                print(er)
            }
        })
        waitForExpectations(timeout: 4)
        
    }
    
    
    func testGetRemoteFootballTeamsWithStableInternetConnection() throws {
        let expectationInstance = expectation(description: "wait until api gets result")
                guard allSportsApiServiec != nil else {
                    XCTFail("AllSportsApiService instance is nil referance")
                    return
                }

        allSportsApiServiec?.getLeagueTeamsScores(sportType: SportType.FOOTBALL, leagueID: "", completion: { (result : Result<LeagueTeams,Error>) in
            switch result {
            case .success(let matchList):
                //When
                let result = (matchList.result?.count != 0)
                //Then
                XCTAssertTrue(result)
                expectationInstance.fulfill()
                                       
            case .failure(let er):
                print(er)
            }
        })
        waitForExpectations(timeout: 4)
        
    }
    
    func testGetRemoteTennisPlayersWithStableInternetConnection() throws {
        let expectationInstance = expectation(description: "wait until api gets result")
                guard allSportsApiServiec != nil else {
                    XCTFail("AllSportsApiService instance is nil referance")
                    return
                }

        allSportsApiServiec?.getTennisPlayerByLeagueId( leagueID: "", completion: { (result : Result<TennisPlayers,Error>) in
            switch result {
            case .success(let matchList):
                //When
                let result = (matchList.result?.count != 0)
                //Then
                XCTAssertTrue(result)
                expectationInstance.fulfill()
                                       
            case .failure(let er):
                print(er)
            }
        })
        waitForExpectations(timeout: 4)
        
    }
    
    
  

}
