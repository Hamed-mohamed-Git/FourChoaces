//
//  LeageDataMappear.swift
//  FourCoaches
//
//  Created by Hamed Mohamed on 07/05/2023.
//

import Foundation


//MARK: - LeageFixtureDataMappear

class LeageFixtureDataMappear {
    //MARK: - convertFixtureFootball
    static func convertFixtureFootball(fixture:FootballFixture) -> [LeagueFixture]{
        var fixtureMatchList:[LeagueFixture] = []
        fixture.result?.forEach({ footballMatch in
            fixtureMatchList.append(LeagueFixture(awayTeam: footballMatch.event_away_team ?? "", homeTeam: footballMatch.event_home_team ?? "", awayLogoUrl: footballMatch.away_team_logo ?? "", homeLogoUrl: footballMatch.home_team_logo ?? "", matchTime: footballMatch.event_time ?? "--", matchDate: footballMatch.event_date ?? "--" , stadium: footballMatch.event_stadium ?? footballMatch.league_name ?? "--"))
        })
        return fixtureMatchList
    }
    
    //MARK: - convertFixtureFootball
    static func convertFixtureBasketball(fixture:BasketballFixture) -> [LeagueFixture]{
        var fixtureMatchList:[LeagueFixture] = []
        fixture.result?.forEach({ footballMatch in
            fixtureMatchList.append(LeagueFixture(awayTeam: footballMatch.event_away_team ?? "", homeTeam: footballMatch.event_home_team ?? "", awayLogoUrl: footballMatch.event_away_team_logo ?? "", homeLogoUrl: footballMatch.event_home_team_logo ?? "" , matchTime: footballMatch.event_time ?? "--" , matchDate: footballMatch.event_date ?? "--" , stadium: footballMatch.event_stadium ?? footballMatch.country_name ?? footballMatch.league_name ?? "" ))
        })
        return fixtureMatchList
    }
    
    //MARK: - convertFixtureTennis
    static func convertFixtureTennis(fixture:TinnesFixture) -> [LeagueFixture]{
        var fixtureMatchList:[LeagueFixture] = []
        fixture.result?.forEach({ footballMatch in
            fixtureMatchList.append(LeagueFixture(awayTeam: footballMatch.event_second_player ?? "", homeTeam: footballMatch.event_first_player ?? "", awayLogoUrl: footballMatch.event_second_player_logo ?? "", homeLogoUrl: footballMatch.event_first_player_logo ?? "", matchTime: footballMatch.event_time ?? "--", matchDate: footballMatch.event_date ?? "--", stadium: footballMatch.country_name ?? footballMatch.league_name ?? ""))
        })
        return fixtureMatchList
    }
    
    //MARK: - convertFixtureCricket
    static func convertFixtureCricket(fixture:CricketFixture) -> [LeagueFixture]{
        var fixtureMatchList:[LeagueFixture] = []
        fixture.result?.forEach({ footballMatch in
            fixtureMatchList.append(LeagueFixture(awayTeam: footballMatch.event_away_team ?? "", homeTeam: footballMatch.event_home_team ?? "", awayLogoUrl: footballMatch.event_away_team_logo ?? "", homeLogoUrl: footballMatch.event_home_team_logo ?? "", matchTime: footballMatch.event_time ?? "--", matchDate: footballMatch.event_date_start ?? footballMatch.event_date_stop ?? "--", stadium: footballMatch.event_stadium ?? footballMatch.country_name ?? footballMatch.league_name ?? "--"))
        })
        return fixtureMatchList
    }
}






//MARK: - LeageLiveScoreDataMappear
class LeageLiveScoreDataMappear {
    //MARK: - convertLiveScoreFootball
    static func convertLiveScoreFootball(fixture:FootballFixture) -> [LeagueLiveScore]{
        var fixtureMatchList:[LeagueLiveScore] = []
        fixture.result?.forEach({ footballMatch in
            fixtureMatchList.append(LeagueLiveScore(awayTeam: footballMatch.event_away_team ?? "", homeTeam: footballMatch.event_home_team ?? "", awayLogoUrl: footballMatch.away_team_logo ?? "", homeLogoUrl: footballMatch.home_team_logo ?? "" , stadium: footballMatch.event_stadium ?? footballMatch.country_name ?? footballMatch.league_name ?? "", finalResult: footballMatch.event_final_result ?? footballMatch.event_halftime_result ?? "--"))
        })
        return fixtureMatchList
    }
    
    //MARK: - convertLiveScoreBasketball
    static func convertLiveScoreBasketball(fixture:BasketballFixture) -> [LeagueLiveScore]{
        var fixtureMatchList:[LeagueLiveScore] = []
        fixture.result?.forEach({ footballMatch in
            fixtureMatchList.append(LeagueLiveScore(awayTeam: footballMatch.event_away_team ?? "", homeTeam: footballMatch.event_home_team ?? "", awayLogoUrl: footballMatch.event_away_team_logo ?? "", homeLogoUrl: footballMatch.event_home_team_logo ?? "" , stadium: footballMatch.event_stadium ?? footballMatch.country_name ?? footballMatch.league_name ?? "", finalResult: footballMatch.event_final_result ?? footballMatch.event_halftime_result ?? "--"))
        })
        return fixtureMatchList
    }
    
    //MARK: - convertLiveScoreTennis
    static func convertLiveScoreTennis(fixture:TinnesFixture) -> [LeagueLiveScore]{
        var fixtureMatchList:[LeagueLiveScore] = []
        fixture.result?.forEach({ footballMatch in
            fixtureMatchList.append(LeagueLiveScore(awayTeam: footballMatch.event_second_player ?? "", homeTeam: footballMatch.event_first_player ?? "", awayLogoUrl: footballMatch.event_second_player_logo ?? "", homeLogoUrl: footballMatch.event_first_player_logo ?? "" , stadium: footballMatch.league_name ?? footballMatch.country_name ?? footballMatch.country_name ?? footballMatch.league_name ?? "", finalResult: footballMatch.event_final_result ?? footballMatch.event_final_result ?? "--"))
        })
        return fixtureMatchList
    }
    
    //MARK: - convertLiveScoreFootball
    static func convertLiveScoreCricket(fixture:CricketFixture) -> [LeagueLiveScore]{
        var fixtureMatchList:[LeagueLiveScore] = []
        fixture.result?.forEach({ footballMatch in
            fixtureMatchList.append(LeagueLiveScore(awayTeam: footballMatch.event_away_team ?? "", homeTeam: footballMatch.event_home_team ?? "", awayLogoUrl: footballMatch.event_away_team_logo ?? "", homeLogoUrl: footballMatch.event_home_team_logo ?? "" , stadium: footballMatch.event_stadium ?? footballMatch.country_name ?? footballMatch.league_name ?? "", finalResult:footballMatch.event_away_final_result ?? footballMatch.event_home_final_result ?? "--"))
        })
        return fixtureMatchList
    }
    
    

}


//MARK: - convertLiveScoreFootball
class LeageTennisPlayerMappear {
    static func converTennisPlayers(playerList:[TennisPlayerItem]) -> [TeamItem] {
        var teamList:[TeamItem] = []
        playerList.forEach { tennisPlayer in
            teamList.append(TeamItem(teamKey: tennisPlayer.player_key, teamName: tennisPlayer.player_name, teamLogo: tennisPlayer.player_logo, players: nil, coaches: nil))
        }
        return teamList
    }
}
