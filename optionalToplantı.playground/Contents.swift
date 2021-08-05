
// TODO: Yedek ve asıl oyuncuları ayırma.

struct FootballTeam {
    
    var players: [Player]
    let name: String
    let country: String?
    let colors: (primary: String?, secondary: String?)
    let stadium: String?
}

struct Player {
    
    let name: String
    let surname: String
    let id: Int
    var jerseyNumber: Int
    var injuryReport: String?
    var position: PositionType
    
    
    enum PositionType {
        case goalKeeper
        case defender
        case midfielder
        case forward
    }
}

struct PlayerStore {
    
    let player1: Player = Player.init(name: "Alex de", surname: "Souza", id: 01, jerseyNumber: 10,
                                        position: Player.PositionType.midfielder)
    let player2: Player = Player.init(name: "Roberto", surname: "Carlos", id: 02, jerseyNumber: 3,
                                        position: Player.PositionType.defender)
    let player3: Player = Player.init(name: "Volkan", surname: "Demirel", id: 03, jerseyNumber: 1,
                                        position: Player.PositionType.goalKeeper)
    let player4: Player = Player.init(name: "Semih", surname: "Şentürk", id: 04, jerseyNumber: 11,
                                        position: Player.PositionType.forward)
    let player5: Player = Player.init(name: "Goerge", surname: "Hagi", id: 05, jerseyNumber: 10,
                                        position: Player.PositionType.midfielder)
    let player6: Player = Player.init(name: "Mondra", surname: "Mondragon", id: 06, jerseyNumber: 1,
                                        position: Player.PositionType.goalKeeper)
    let player7: Player = Player.init(name: "Sabri", surname: "Sarıoğlu", id: 07, jerseyNumber: 55,
                                        position: Player.PositionType.defender)
    let player8: Player = Player.init(name: "Johan", surname: "Elmander", id: 08, jerseyNumber: 11,
                                        position: Player.PositionType.forward)
    let player9: Player = Player.init(name: "Radamel", surname: "Falcao", id: 09, jerseyNumber: 99,
                                      injuryReport: "Foot", position: Player.PositionType.forward)
    let player10: Player = Player.init(name: "Robin van", surname: "Persie", id: 10, jerseyNumber: 99,
                                       injuryReport: "Head", position: Player.PositionType.forward)
}

let playerStore = PlayerStore()

let Fenerbahçe: FootballTeam = FootballTeam.init(players: [playerStore.player1, playerStore.player2, playerStore.player3, playerStore.player4, playerStore.player10], name:"Fenerbahçe" , country: "İstanbul", colors: (primary: "Yellow", secondary: "Blue"), stadium: "Şükrü Saraçoğlu")

let Galatasaray: FootballTeam = FootballTeam.init(players: [playerStore.player5, playerStore.player6, playerStore.player7, playerStore.player8, playerStore.player9], name:"Galatasaray" , country: "İstanbul", colors: (primary: "Yellow", secondary: "Red"), stadium: "TT Arena")


