
// TODO: Yedek ve asıl oyuncuları ayırma.

struct FootballTeam {
    
    var players: [Player]
    let name: String
    let country: String?
    let colors: (primary: String?, secondary: String?)
    let stadium: String?
    var score: Int?
    

}

struct Player {
    
    let name: String
    let surname: String
    let id: Int
    var jerseyNumber: Int
    var injuryReport: String?
    var position: PositionType
   // let finishing: Int
    let heading: Int
    
    
    enum PositionType {
        case goalKeeper
        case defender
        case midfielder
        case forward
    }
}

//struct PlayerStore {
//
//    let player1: Player = Player.init(name: "Alex de", surname: "Souza", id: 01, jerseyNumber: 10,
//                                      position: Player.PositionType.midfielder)
//    let player2: Player = Player.init(name: "Roberto", surname: "Carlos", id: 02, jerseyNumber: 3,
//                                        position: Player.PositionType.defender)
//    let player3: Player = Player.init(name: "Volkan", surname: "Demirel", id: 03, jerseyNumber: 1,
//                                        position: Player.PositionType.goalKeeper)
//    let player4: Player = Player.init(name: "Semih", surname: "Şentürk", id: 04, jerseyNumber: 11,
//                                        position: Player.PositionType.forward)
//    let player5: Player = Player.init(name: "Goerge", surname: "Hagi", id: 05, jerseyNumber: 10,
//                                        position: Player.PositionType.midfielder)
//    let player6: Player = Player.init(name: "Mondra", surname: "Mondragon", id: 06, jerseyNumber: 1,
//                                        position: Player.PositionType.goalKeeper)
//    let player7: Player = Player.init(name: "Sabri", surname: "Sarıoğlu", id: 07, jerseyNumber: 55,
//                                        position: Player.PositionType.defender)
//    let player8: Player = Player.init(name: "Johan", surname: "Elmander", id: 08, jerseyNumber: 11,
//                                        position: Player.PositionType.forward)
//    let player9: Player = Player.init(name: "Radamel", surname: "Falcao", id: 09, jerseyNumber: 99,
//                                      injuryReport: "Foot", position: Player.PositionType.forward)
//    let player10: Player = Player.init(name: "Robin van", surname: "Persie", id: 10, jerseyNumber: 99,
//                                       injuryReport: "Head", position: Player.PositionType.forward)
//}


let player1: Player = Player.init(name: "Alex de", surname: "Souza", id: 01, jerseyNumber: 10,
                                  position: Player.PositionType.midfielder, heading: 75)
let player2: Player = Player.init(name: "Roberto", surname: "Carlos", id: 02, jerseyNumber: 3,
                                  position: Player.PositionType.defender, heading: 50)
let player3: Player = Player.init(name: "Volkan", surname: "Demirel", id: 03, jerseyNumber: 1,
                                  position: Player.PositionType.goalKeeper, heading: 10)
let player4: Player = Player.init(name: "Semih", surname: "Şentürk", id: 04, jerseyNumber: 11,
                                  position: Player.PositionType.forward, heading: 86)
let player5: Player = Player.init(name: "Goerge", surname: "Hagi", id: 05, jerseyNumber: 10,
                                  position: Player.PositionType.midfielder, heading: 75)
let player6: Player = Player.init(name: "Mondra", surname: "Mondragon", id: 06, jerseyNumber: 1,
                                  position: Player.PositionType.goalKeeper, heading: 10)
let player7: Player = Player.init(name: "Sabri", surname: "Sarıoğlu", id: 07, jerseyNumber: 55,
                                  position: Player.PositionType.defender, heading: 35)
let player8: Player = Player.init(name: "Johan", surname: "Elmander", id: 08, jerseyNumber: 11,
                                  position: Player.PositionType.forward, heading: 90)
let player9: Player = Player.init(name: "Radamel", surname: "Falcao", id: 09, jerseyNumber: 99,
                                  injuryReport: "Foot", position: Player.PositionType.forward, heading: 80)
let player10: Player = Player.init(name: "Robin van", surname: "Persie", id: 10, jerseyNumber: 99,
                                   injuryReport: "Head", position: Player.PositionType.forward, heading: 90)

let Fenerbahçe: FootballTeam = FootballTeam(players: [player1, player2, player3, player4, player10], name:"Fenerbahçe" , country: "İstanbul", colors: (primary: "Yellow", secondary: "Blue"), stadium: "Şükrü Saraçoğlu")

let Galatasaray: FootballTeam = FootballTeam(players: [player5, player6, player7, player8, player9], name:"Galatasaray" , country: "İstanbul", colors: (primary: "Yellow", secondary: "Red"), stadium: "TT Arena")

//func canScore(finishing: Int) -> Bool {
//    return true
//}

func squadAnnouncement(squadOne: FootballTeam, squadTwo: FootballTeam) {
    
    print("We have an Istanbul Derby today. \(squadOne.name) will face against \(squadTwo.name)")
    print("\(squadOne.name)'s starting eleven is \(squadOne.players.map{$0.name})")
    print("\(squadTwo.name)'s starting eleven is \(squadTwo.players.map{$0.name})")
    
}

squadAnnouncement(squadOne: Fenerbahçe, squadTwo: Galatasaray)


func cornerGoal(team: FootballTeam) {
    var teamScore = team.score ?? 0
    let goalScorer = team.players.randomElement()
    if goalScorer!.heading >= 85 {
        teamScore += 1
        print ("\(team) will be using corner kick. \(goalScorer!) has scored an absolute header!")
    } else {
        print("Not Goal")
    }
}

cornerGoal(team: Fenerbahçe)
