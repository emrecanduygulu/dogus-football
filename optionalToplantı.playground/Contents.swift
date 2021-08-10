
// TODO: Yedek ve asıl oyuncuları ayırma.

struct FootballTeam {
    
    var players: [Player]
    let name: String
    let country: String?
    let colors: (primary: String?, secondary: String?)
    let stadium: String?

    var starters: [Player] {
        players.filter() { player -> Bool in player.injuryReport == nil }
    }
}

struct Player {
    
    let name: String
    let surname: String
    let id: Int
    var jerseyNumber: Int
    var injuryReport: String?
    var position: PositionType
    let heading: Int
    let finishing: Int
    
    var fullName: String {
        return name + " " + surname
    }
    
    
    enum PositionType {
        case goalKeeper
        case defender
        case midfielder
        case forward
    }
}

let player1: Player = Player.init(name: "Alex de", surname: "Souza", id: 01, jerseyNumber: 10,
                                  position: Player.PositionType.midfielder, heading: 75, finishing: 85)
let player2: Player = Player.init(name: "Roberto", surname: "Carlos", id: 02, jerseyNumber: 3,
                                  position: Player.PositionType.defender, heading: 50, finishing: 75)
let player3: Player = Player.init(name: "Volkan", surname: "Demirel", id: 03, jerseyNumber: 1,
                                  position: Player.PositionType.goalKeeper, heading: 10, finishing: 1)
let player4: Player = Player.init(name: "Semih", surname: "Şentürk", id: 04, jerseyNumber: 11,
                                  position: Player.PositionType.forward, heading: 86, finishing: 77)
let player5: Player = Player.init(name: "Goerge", surname: "Hagi", id: 05, jerseyNumber: 10,
                                  position: Player.PositionType.midfielder, heading: 75, finishing: 85)
let player6: Player = Player.init(name: "Mondra", surname: "Mondragon", id: 06, jerseyNumber: 1,
                                  position: Player.PositionType.goalKeeper, heading: 10, finishing: 1)
let player7: Player = Player.init(name: "Sabri", surname: "Sarıoğlu", id: 07, jerseyNumber: 55,
                                  position: Player.PositionType.defender, heading: 35, finishing: 55)
let player8: Player = Player.init(name: "Johan", surname: "Elmander", id: 08, jerseyNumber: 11,
                                  position: Player.PositionType.forward, heading: 90, finishing: 80)
let player9: Player = Player.init(name: "Radamel", surname: "Falcao", id: 09, jerseyNumber: 99,
                                  injuryReport: "Foot", position: Player.PositionType.forward, heading: 80, finishing: 88)
let player10: Player = Player.init(name: "Robin van", surname: "Persie", id: 10, jerseyNumber: 99,
                                   injuryReport: "Head", position: Player.PositionType.forward, heading: 90, finishing: 85)

let Fenerbahçe: FootballTeam = FootballTeam(players: [player1, player2, player3, player4, player10], name:"Fenerbahçe" , country: "İstanbul", colors: (primary: "Yellow", secondary: "Blue"), stadium: "Şükrü Saraçoğlu")

let Galatasaray: FootballTeam = FootballTeam(players: [player5, player6, player7, player8, player9], name:"Galatasaray" , country: "İstanbul", colors: (primary: "Yellow", secondary: "Red"), stadium: "TT Arena")


func squadAnnouncement(squadOne: FootballTeam, squadTwo: FootballTeam) {
    
    print("We have an Istanbul Derby today. \(squadOne.name) will face against \(squadTwo.name)")
    
    func teamAnnouncement(team: FootballTeam) -> String {
        
         "\(team.name)'s starting eleven is  \(team.starters.map{$0.fullName}.joined(separator: "\n"))"
    }
    print(teamAnnouncement(team: squadOne))
    print(teamAnnouncement(team: squadTwo))
}

squadAnnouncement(squadOne: Fenerbahçe, squadTwo: Galatasaray)


var fenerbahceScore = 0
var galatasarayScore = 0

enum BoxField: CaseIterable {
    case leftWing 
    case rightWing
    case center
    case outside
    
    var expectedGoals: Double {
        switch self {
        case .leftWing:
            return 0.60
        case .rightWing:
            return 0.60
        case .center:
            return 0.70
        case .outside:
            return 0.50
            }
        }
    var fieldNames: String {
        switch self {
        case .leftWing:
            return "left wing"
        case .rightWing:
            return "right wing"
        case .center:
            return "center"
        case .outside:
            return "outside"
        }
    }
}

func canScore (team: FootballTeam) -> Bool {
    let goalScorer = team.starters.randomElement()
    guard let scorer = goalScorer else { return false }
    guard let randomField = BoxField.allCases.randomElement() else { return false }
    let goalPossibility = Double(scorer.finishing) * randomField.expectedGoals
    let minGoalPossibilityPercantage = 40.0
    return goalPossibility >= minGoalPossibilityPercantage
//    {
//        if team.name == "Fenerbahçe" {
//            fenerbahceScore += 1
//        }else {
//            galatasarayScore += 1
//        }
//        print("\(scorer.fullName) scored from the \(randomField.fieldNames). Fenerbahçe \(fenerbahceScore) - Galatasaray \(galatasarayScore)")
//    } else { print("\(scorer.fullName) took the shot from the \(randomField.fieldNames) but it didn't went in.")
//
//    }
}

func cornerGoal(team: FootballTeam) {
    let goalScorer = team.starters.randomElement()
    guard let scorer = goalScorer else { return }
    if scorer.heading >= 80 {
        if team.name == "Fenerbahçe" {
            fenerbahceScore += 1
        }else {
            galatasarayScore += 1
        }
        print ("\(team.name) will be using corner kick. \(scorer.fullName) has scored an absolute header! Fenerbahçe \(fenerbahceScore) - Galatasaray \(galatasarayScore)")
    } else {
        print("\(scorer.fullName) jumped really well but he couldn't score")
    }
}

cornerGoal(team: Fenerbahçe)
cornerGoal(team: Galatasaray)
let isFenerbahçeScored = canScore(team: Fenerbahçe)
let isGalatasarayScored = canScore(team: Galatasaray)
print(fenerbahceScore)
print(galatasarayScore)



