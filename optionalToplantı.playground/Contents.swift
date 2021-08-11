import Foundation
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

let Fenerbahçe: FootballTeam = FootballTeam.init(players: [player1, player2, player3, player4, player10], name:"Fenerbahçe" , country: "İstanbul", colors: (primary: "Yellow", secondary: "Blue"), stadium: "Şükrü Saraçoğlu")

let Galatasaray: FootballTeam = FootballTeam.init(players: [player5, player6, player7, player8, player9], name:"Galatasaray" , country: "İstanbul", colors: (primary: "Yellow", secondary: "Red"), stadium: "TT Arena")


func startMatch(homeTeam: FootballTeam, awayTeam: FootballTeam) {
    var scoreHomeTeam: Int = 0
    var scoreAwayTeam: Int = 0
    let matchTeams = [homeTeam, awayTeam]
    var randomTeam = matchTeams.randomElement()!
    var randomMinute = Int.random(in: 1..<15)
    var eventStartTime = 1
    var eventEndTime = 15
    let eventTimeRange = 15
    let matchEndTime = 90
    let duration : UInt32 = 2
    
    func matchEntryAnnouncement() {
        print("İyi akşamlar değerli futbolseverler. Bugün \(homeTeam.name), \(awayTeam.country!) ekibi \(awayTeam.name) takımını \(homeTeam.stadium!) Stadı'nda ağırlıyor. Bu maçın canlı anlatımında sizinle olacağız.")
        sleep(duration)
        print("Ve ilk 11'ler ekranlarda.")
        sleep(duration)
        topElevenAnnouncement(team: homeTeam)
        topElevenAnnouncement(team: awayTeam)
        print("Maç başlamak üzere..")
        sleep(duration)
        print("[1'] İlk düdük geliyor ve maç başlıyor. İki takıma da başarılar dileriz.")
        sleep(duration)
        
        func topElevenAnnouncement(team: FootballTeam){
            print("\(team.name) takımının ilk 11'i")
            for player in team.players {
                print("\(player.fullName) \t\t \(player.jerseyNumber)")
            }
            sleep(duration)
        }
    }
    
    func matchEndAnnouncement() -> String {
        func matchTotalScoreAnnouncement() -> String{
            if scoreHomeTeam == scoreAwayTeam {
                return "Karşılaşmada kazanan çıkmıyor. İki takımda birer puan kazanıyor"
            }else if(scoreHomeTeam > scoreAwayTeam){
                return "Kazanan takım \(homeTeam.name) oluyor. Evinde kaybetmeyerek 3 puanı kazanıyor"
            }else{
                return "Kazanan takım \(awayTeam.name) oluyor. Bu zorlu deplasmandan 3 puanı almayı başarıyor"
            }
        }
        return ("Veee maç bitiyor..\(matchTotalScoreAnnouncement())")
    }
    
    func scoreGoal() -> String{
        func goalScorer() -> String{
            if randomTeam.name == homeTeam.name {
                return homeTeam.players.randomElement()!.fullName
            }else{
                return awayTeam.players.randomElement()!.fullName
            }
        }
        
        func resultAfterGoal() -> String{
            if (scoreHomeTeam == scoreAwayTeam) {
                return "beraberliği yakaladı"
            }else{
                return "yapıyor"
            }
        }
        
        return " \(randomMinute)' GOOOLLLLL! Golün adı \(goalScorer()). \(randomTeam.name) skoru \(scoreHomeTeam)-\(scoreAwayTeam) \(resultAfterGoal())."
    }
    
    func cardToPlayer() -> String{
        let isRedCard =  Bool.random()
        
        return "\(randomMinute)'" + (isRedCard ? "Kırmızı kart! \(randomTeam.players.randomElement()!.fullName) bu sert müdahalesi sonucunda oyundan atılıyor." : "Sarı kart! \(randomTeam.players.randomElement()!.fullName) adlı oyuncuya çıkıyor.")
    }
    
    func editScore(){
        if randomTeam.name == homeTeam.name {
            scoreHomeTeam += 1
        }else{
            scoreAwayTeam += 1
        }
    }
    
    func randomHighlight() {
        if Bool.random() {
            editScore()
            print(scoreGoal())
        }else{
            print(cardToPlayer())
        }
        sleep(duration)
    }
    
    matchEntryAnnouncement()
    
    while (eventEndTime != matchEndTime + eventTimeRange){
        randomTeam = matchTeams.randomElement()!
        randomMinute = Int.random(in: eventStartTime..<eventEndTime)
        randomHighlight()
        eventStartTime += eventTimeRange
        eventEndTime += eventTimeRange
    }
    print(matchEndAnnouncement())
}

startMatch(homeTeam: Galatasaray, awayTeam: Fenerbahçe)
