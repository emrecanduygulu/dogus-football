
// TODO: Yedek ve asıl oyuncuları ayırma.

struct FootballTeam {
    
    var players: [Player]
    let name: String
    let country: String?
    let colors: (primary: String?, secondary: String?)
    let stadium: String?
    var starters: [Player] {
        players.filter() { player -> Bool in player.injuryReport == nil && player.squadStatus == .starter }
    }
    var bench: [Player] {
        players.filter() { player -> Bool in player.injuryReport == nil && player.squadStatus == .substitute }
    }
}

struct Player: Equatable {
    
    let name: String
    let surname: String
    let id: Int
    var jerseyNumber: Int
    var injuryReport: String?
    var position: PositionType
    var squadStatus: SquadStatus
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
    enum SquadStatus {
        case starter
        case substitute
        case reserve
    }
}

let player1: Player = Player.init(name: "Alex de", surname: "Souza", id: 01, jerseyNumber: 10,
                                  position: Player.PositionType.midfielder, squadStatus: Player.SquadStatus.starter, heading: 75, finishing: 85)
let player2: Player = Player.init(name: "Roberto", surname: "Carlos", id: 02, jerseyNumber: 3,
                                  position: Player.PositionType.defender, squadStatus: Player.SquadStatus.starter, heading: 50, finishing: 75)
let player3: Player = Player.init(name: "Volkan", surname: "Demirel", id: 03, jerseyNumber: 1,
                                  position: Player.PositionType.goalKeeper, squadStatus: Player.SquadStatus.starter, heading: 10, finishing: 1)
let player4: Player = Player.init(name: "Semih", surname: "Şentürk", id: 04, jerseyNumber: 11,
                                  position: Player.PositionType.forward, squadStatus: Player.SquadStatus.starter, heading: 86, finishing: 77)
let player5: Player = Player.init(name: "Goerge", surname: "Hagi", id: 05, jerseyNumber: 10,
                                  position: Player.PositionType.midfielder, squadStatus: Player.SquadStatus.starter, heading: 75, finishing: 85)
let player6: Player = Player.init(name: "Mondra", surname: "Mondragon", id: 06, jerseyNumber: 1,
                                  position: Player.PositionType.goalKeeper, squadStatus: Player.SquadStatus.starter, heading: 10, finishing: 1)
let player7: Player = Player.init(name: "Sabri", surname: "Sarıoğlu", id: 07, jerseyNumber: 55,
                                  position: Player.PositionType.defender, squadStatus: Player.SquadStatus.starter, heading: 35, finishing: 55)
let player8: Player = Player.init(name: "Johan", surname: "Elmander", id: 08, jerseyNumber: 11,
                                  position: Player.PositionType.forward, squadStatus: Player.SquadStatus.starter, heading: 90, finishing: 80)
let player9: Player = Player.init(name: "Radamel", surname: "Falcao", id: 09, jerseyNumber: 99,
                                  injuryReport: "Foot", position: Player.PositionType.forward, squadStatus: Player.SquadStatus.starter, heading: 80, finishing: 88)
let player10: Player = Player.init(name: "Robin van", surname: "Persie", id: 10, jerseyNumber: 99,
                                   injuryReport: "Head", position: Player.PositionType.forward, squadStatus: Player.SquadStatus.starter, heading: 90, finishing: 85)
let player11: Player = Player.init(name: "Mert", surname: "Günok", id: 11, jerseyNumber: 87,
                                   position: Player.PositionType.goalKeeper, squadStatus: Player.SquadStatus.substitute, heading: 10, finishing: 1)
let player12: Player = Player.init(name: "Diego", surname: "Lugano", id: 12, jerseyNumber: 4,
                                   position: Player.PositionType.defender, squadStatus: Player.SquadStatus.substitute, heading: 90, finishing: 15)
let player13: Player = Player.init(name: "Deivid", surname: "de Souza", id: 13, jerseyNumber: 9,
                                   position: Player.PositionType.midfielder, squadStatus: Player.SquadStatus.substitute, heading: 65, finishing: 75)
let player14: Player = Player.init(name: "Mateja", surname: "Kezman", id: 14, jerseyNumber: 79,
                                   position: Player.PositionType.forward, squadStatus: Player.SquadStatus.substitute, heading: 78, finishing: 80)
let player15: Player = Player.init(name: "Fernando", surname: "Muslera", id: 15, jerseyNumber: 87,
                                   position: Player.PositionType.goalKeeper, squadStatus: Player.SquadStatus.substitute, heading: 10, finishing: 1)
let player16: Player = Player.init(name: "Servet", surname: "Çetin", id: 16, jerseyNumber: 67,
                                   position: Player.PositionType.defender, squadStatus: Player.SquadStatus.substitute, heading: 90, finishing: 15)
let player17: Player = Player.init(name: "Cassio", surname: "Lincoln", id: 17, jerseyNumber: 20,
                                   position: Player.PositionType.midfielder, squadStatus: Player.SquadStatus.substitute, heading: 55, finishing: 85)
let player18: Player = Player.init(name: "Didier", surname: "Drogba", id: 08, jerseyNumber: 98,
                                   position: Player.PositionType.forward, squadStatus: Player.SquadStatus.substitute, heading: 90, finishing: 90)

let Fenerbahçe: FootballTeam = FootballTeam(players: [player1, player2, player3, player4, player10, player11, player12, player13, player14], name:"Fenerbahçe" , country: "İstanbul", colors: (primary: "Yellow", secondary: "Blue"), stadium: "Şükrü Saraçoğlu")

let Galatasaray: FootballTeam = FootballTeam(players: [player5, player6, player7, player8, player9, player15, player16, player17, player18], name:"Galatasaray" , country: "İstanbul", colors: (primary: "Yellow", secondary: "Red"), stadium: "TT Arena")


func match(teamOne: FootballTeam, teamTwo: FootballTeam) {
    var teamOneScore = 0
    var teamTwoScore = 0
    var teamOneStarters = teamOne.starters
    var teamTwoStarters = teamTwo.starters
    
    func squadAnnouncement(squadOne: FootballTeam, squadTwo: FootballTeam) {
        
        print("We have an Istanbul Derby today. \(squadOne.name) will face against \(squadTwo.name)")
        
        func teamAnnouncement(team: FootballTeam) -> String {
            
            "\(team.name)'s starting eleven is  \(team.starters.map{$0.fullName}.joined(separator: "\n"))"
        }
        print(teamAnnouncement(team: squadOne))
        print(teamAnnouncement(team: squadTwo))
    }
    
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
    
    func goalFromTheBox (team: FootballTeam) {
        let playersOnThePitch = team.name == teamOne.name ? teamOneStarters : teamTwoStarters
        let goalScorer = playersOnThePitch.randomElement()
        guard let scorer = goalScorer else { return }
        guard let randomField = BoxField.allCases.randomElement() else { return }
        let goalPossibility = Double(scorer.finishing) * randomField.expectedGoals
        let minGoalPossibilityPercantage = 40.0
        if goalPossibility >= minGoalPossibilityPercantage {
            if team.name == teamOne.name {
                teamOneScore += 1
            }else {
                teamTwoScore += 1
            }
            print("\(scorer.fullName) scored from the \(randomField.fieldNames). \(teamOne.name) \(teamOneScore) - \(teamTwo.name) \(teamTwoScore)")
        } else { print("\(scorer.fullName) took the shot from the \(randomField.fieldNames) but it didn't went in.")
        }
    }
    
    func cornerGoal(team: FootballTeam) {
        let playersOnThePitch = team.name == teamOne.name ? teamOneStarters : teamTwoStarters
        let goalScorer = playersOnThePitch.randomElement()
        guard let scorer = goalScorer else { return }
        if scorer.heading >= 80 {
            if team.name == teamOne.name {
                teamOneScore += 1
            }else {
                teamTwoScore += 1
            }
            print ("\(team.name) will be using corner kick. \(scorer.fullName) has scored an absolute header! \(teamOne.name) \(teamOneScore) - \(teamTwo.name) \(teamTwoScore)")
        } else {
            print("\(scorer.fullName) jumped really well but he couldn't score")
        }
    }
    
    func commitingFoul(team: FootballTeam) {
        let randomInt = Int.random(in: 0..<10)
        let playersOnThePitch = team.name == teamOne.name ? teamOneStarters : teamTwoStarters
        let randomPlayer = playersOnThePitch.randomElement()
        guard let player = randomPlayer else { return }
        if randomInt == 0 {
            if team.name == teamOne.name {
                if let index = teamOneStarters.firstIndex(of: player) {
                    teamOneStarters.remove(at: index)
                }
            }else if team.name == teamTwo.name {
                if let index = teamTwoStarters.firstIndex(of: player) {
                    teamTwoStarters.remove(at: index)
                }
            }
            print("\(player.fullName) received red card! \(team.name) is missing one player now.")
        }else if randomInt <= 4 && randomInt > 0 {
            print("\(player.fullName) received yellow card.")
        }else {
            print("\(player.fullName) has made a foul.")
        }
    }
    
    func substitution(team: FootballTeam) {
        let playerGoesIn = team.bench.randomElement()
        guard let subsIn = playerGoesIn else { return }
        let playerGoesOut = team.starters.randomElement()
        guard let subsOut = playerGoesOut else { return }
        if team.name == teamOne.name {
            if let index = teamOneStarters.firstIndex(of: subsOut){
                switch subsOut.position {
                case .defender:
                    teamOneStarters.remove(at: index)
                    teamOneStarters.append(subsIn)
                    print("\(teamOne.name) making a substitution. \(subsIn.fullName) goes in and \(subsOut.fullName) goes out.")
                case .midfielder:
                    teamOneStarters.remove(at: index)
                    teamOneStarters.append(subsIn)
                    print("\(teamOne.name) making a substitution. \(subsIn.fullName) goes in and \(subsOut.fullName) goes out.")
                case .forward:
                    teamOneStarters.remove(at: index)
                    teamOneStarters.append(subsIn)
                    print("\(teamOne.name) making a substitution. \(subsIn.fullName) goes in and \(subsOut.fullName) goes out.")
                default:
                    return
                }
            }
        } else if team.name == teamTwo.name {
            if let index = teamTwoStarters.firstIndex(of: subsOut){
                switch subsOut.position {
                case .defender:
                    teamTwoStarters.remove(at: index)
                    teamTwoStarters.append(subsIn)
                    print("\(teamTwo.name) making a substitution. \(subsIn.fullName) goes in and \(subsOut.fullName) goes out.")
                case .midfielder:
                    teamTwoStarters.remove(at: index)
                    teamTwoStarters.append(subsIn)
                    print("\(teamTwo.name) making a substitution. \(subsIn.fullName) goes in and \(subsOut.fullName) goes out.")
                case .forward:
                    teamTwoStarters.remove(at: index)
                    teamTwoStarters.append(subsIn)
                    print("\(teamTwo.name) making a substitution. \(subsIn.fullName) goes in and \(subsOut.fullName) goes out.")
                default:
                    return
                }
            }
        }
    }
    func randomHighlight() {
        let randomInt = Int.random(in: 0..<5)
        switch randomInt {
        case 0: goalFromTheBox(team: teamOne)
        case 1: cornerGoal(team: teamOne)
        case 2: commitingFoul(team: teamOne)
        case 3: goalFromTheBox(team: teamTwo)
        case 4: cornerGoal(team: teamTwo)
        case 5: commitingFoul(team: teamTwo)
        default:
            return
        }
    }
    squadAnnouncement(squadOne: teamOne, squadTwo: teamTwo)
    randomHighlight()
    randomHighlight()
    substitution(team: teamOne)
    randomHighlight()
    substitution(team: teamTwo)
    randomHighlight()
    randomHighlight()
    substitution(team: teamOne)
    randomHighlight()
    randomHighlight()
    substitution(team: teamTwo)
    randomHighlight()
}

match(teamOne: Fenerbahçe, teamTwo: Galatasaray)


