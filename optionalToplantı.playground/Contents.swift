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





func kickOff(home: FootballTeam, away: FootballTeam) {
    var scoreH: Int = 0
    var scoreA: Int = 0
    let teams = [home.name, away.name]
    
    var randomTeam = teams[Int.random(in: 0..<2)]
    var randomInt = Int.random(in: 1..<15)
    
    func kickOffStart() {
        print("İyi akşamlar değerli futbolseverler. Bugün \(home.name), \(away.country!) ekibi \(away.name) takımını \(home.stadium!) Stadı'nda ağırlıyor. Bu maçın canlı anlatımında sizinle olacağız.")
        sleep(2)
        print("Ve ilk 11'ler ekranlarda.")
        sleep(2)
        print("\(home.name) takımının ilk 11'i")
        for player in home.players {
            print("\(player.name) \(player.surname) \t\t \(player.jerseyNumber)")
        }
        sleep(2)
        print("\(away.name) takımının ilk 11'i")
        sleep(2)
        for player in away.players {
            print("\(player.name) \(player.surname) \t\t \(player.jerseyNumber)")
        }
        sleep(2)
        print("Maç başlamak üzere..")
        sleep(1)
        print("[1'] İlk düdük geliyor ve maç başlıyor. İki takıma da başarılar dileriz.")
        sleep(2)
    }
    
    func kickOffEnd() {
        print("Veee maç bitiyor.. \((scoreH == scoreA) ? "Karşılaşmada kazanan çıkmıyor. İki takımda birer puan kazanıyor" : ((scoreH > scoreA) ? "Kazanan takım \(home.name) oluyor. Evinde kaybetmeyerek 3 puanı kazanıyor" : "Kazanan takım \(away.name) oluyor. Bu zorlu deplasmandan 3 puanı almayı başarıyor")).")
    }
    
    func goal() -> String{
        let randomPlayerInt = Int.random(in: 0..<5)
        return "\(randomInt)' GOOOLLLLL! Golün adı \((randomTeam == home.name) ? "\(home.players[randomPlayerInt].name)" : "\(away.players[randomPlayerInt].name)")! \(randomTeam) skoru \(scoreH)-\(scoreA) \((scoreH == scoreA) ? "beraberliği yakaladı" : "yapıyor")."
    }
    
    func card() -> String{
        let randomPlayerInt = Int.random(in: 0..<5)
        
//        if randomTeam == home.name {
//            home.players.remove(at: randomPlayerInt)
//        }else{
//            
//        }
        
        return "\(randomInt)' \((Int.random(in: 0..<2) == 0) ? "Kırmızı kart! \((randomTeam == home.name) ? "\(home.players[randomPlayerInt].name)" : "\(away.players[randomPlayerInt].name)") bu sert müdahalesi sonucunda oyundan atılıyor." : "Sarı kart! \((randomTeam == home.name) ? "\(home.players[randomPlayerInt].name)" : "\(away.players[randomPlayerInt].name)") adlı oyuncuya çıkıyor.")"
    }
    
    func editScore(){
        if randomTeam == home.name {
            scoreH += 1
        }else{
            scoreA += 1
        }
    }
    
    func randomHighlight() {
        if Int.random(in: 0..<2) == 0 {
            editScore()
            print(goal())
        }else{
            print(card())
        }
        sleep(2)
    }
    
    var x = 1
    var y = 15
    kickOffStart()
    
    
    while y != 105 {
        randomTeam = teams[Int.random(in: 0..<2)]
        randomInt = Int.random(in: x..<y)
        randomHighlight()
        x += 15
        y += 15
    }
    kickOffEnd()
}

kickOff(home: Galatasaray, away: Fenerbahçe)
