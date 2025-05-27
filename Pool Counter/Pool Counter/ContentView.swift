//
//  ContentView.swift
//  Pool Counter
//
//  Created by Akshat Thapa on 16/05/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var players: [Player] = []
    @State private var playerToRemove : Player? = nil // This stores the player you tap X on
    @State private var showRemoveAlert : Bool = false // Controls whether the confirmation dialog should be shown
    @State private var profiles: [PlayerProfile] = [] // array of all player profiles
    @State private var showEndSessionAlert : Bool = false // Controles whether the end session alert should show
    
    func saveProfiles() { // Writes profiles to memory
        if let data = try? JSONEncoder().encode(profiles) {
            UserDefaults.standard.set(data, forKey: "profiles") // Stores the data in UserDefaults under the label profiles
        }
    }
    
    func loadProfiles() { // Read profiles from UserDefaults into app
        if let data = UserDefaults.standard.data(forKey: "profiles"), // Look for previous stored data
           let loaded = try? JSONDecoder().decode([PlayerProfile].self, from: data) { // Decode JSON back into array of PlayerProfile objects
            profiles = loaded
        } else{
            profiles = [
                PlayerProfile(id: UUID(), name: "Akshat", totalMatchWins: 0, totalFramesWon: 0 ),
                PlayerProfile(id: UUID(), name: "James", totalMatchWins: 0, totalFramesWon: 0 ),
                PlayerProfile(id :UUID(), name: "Zola",
                              totalMatchWins: 999, totalFramesWon: 999)
                ]
        }
    }
    
    var body: some View {
        NavigationView{
            ZStack {
                // Fullscreen dark background
                Color.gray
                    .ignoresSafeArea()
                
                
                ScrollView {
                    VStack {
                        Text("Saved Profiles")
                            .font(.headline)
                            .foregroundColor(.white)
                        ForEach(profiles) { profile in
                            Text("\(profile.name): \(profile.totalMatchWins) wins, \(profile.totalFramesWon) frames won").foregroundColor(.white)
                        }
                    }
                    .padding()
                    .frame(maxWidth: 340)
                    .background(Color.black.opacity(0.9))
                    .cornerRadius(10)
                    
                    VStack {
                        if players.isEmpty{
                            Text("No players yet. \n Add a player by tapping the plus (+) button in the top right corner.")
                                .font(.headline)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .padding(.vertical)
                        }
                        
                        // Show a card for each player
                        ForEach($players, id: \.id) { $player in
                            VStack {
                                HStack{
                                    Spacer()
                                    Button(action : {
                                        playerToRemove = player
                                        showRemoveAlert = true
                                    }){
                                        Image(systemName: "xmark.circle.fill")
                                            .foregroundColor(.red)
                                            .font(.system(size: 20))
                                    }
                                }
                                Text(player.name)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                Text("\(player.score)")
                                    .font(.system(size :48, weight: .bold, design: .rounded))
                                    .foregroundColor(.white)
                                HStack(spacing: 40) {
                                    Button(action : {
                                        if player.score > 0 { player.score -= 1}
                                    }){
                                        Image(systemName : "minus.circle.fill")
                                            .font(.system(size :60))
                                            .foregroundColor(.white)
                                    }
                                    Button(action : {
                                        player.score += 1
                                    }) {Image(systemName : "plus.circle.fill")
                                            .font(.system(size :60))
                                            .foregroundColor(.white)
                                    }
                                }
                                .padding(.top, 12)
                            }
                            .padding()
                            .frame(maxWidth :340)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.black.opacity(0.6))
                            )
                            .padding(.horizontal)
                        }
                        if !players.isEmpty {
                            Button(action: {
                                showEndSessionAlert = true
                            }) {
                                Text("End Session")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: 260)
                                    .background(Color.red)
                                    .cornerRadius(16)
                            }
                            .padding(.top)
                        }
                    }
                }
            }
            .navigationTitle("Pool Counter").foregroundColor(.black)
            .onAppear {
                loadProfiles()
            }
            .toolbar{
                Button(action :{
                    if let profile = profiles.first(where: { p in
                                !players.contains(where: { $0.name == p.name }) // Not already in match
                            }) {
                                players.append(Player(id: profile.id, name: profile.name, score: 0))
                            }
                    
                }) {
                    HStack(spacing: 4){
                        Image(systemName : "plus.circle.fill")
                        Text("Add")
                    }
                    .font(.headline)
                    .padding(. horizontal, 12)
                    .padding(.vertical, 4)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(.black))
                        
                    )
                    
                    
                }
            }
            .alert(
                "Remove Player?",// Pop up dialog when showRemoveAlert is true and we have a player to remove
                isPresented: $showRemoveAlert,
                presenting : playerToRemove
            ){player in
                Button("Remove", role: .destructive){
                    if let index = players.firstIndex(where: {$0.id == player.id}) { // Find index of player in array by id
                        players.remove(at: index)
                    }
                }
                Button("Cancel", role: .cancel){
                    playerToRemove = nil
                }
            }message: {player in
                Text("Are you sure you want to remove \(player.name) from the current match?")
            }
            
            .alert(
                "End Session",// Pop up dialogue when showEndSessionAlert is true and we want to end the session
                isPresented : $showEndSessionAlert
            ){
                Button("End Session" , role: .destructive) {
                    let maxScore = players.map { $0.score }.max() ?? 0
                    for player in players {
                        if let profileIndex = profiles.firstIndex(where: { $0.id == player.id }) {
                            profiles[profileIndex].totalFramesWon += player.score
                        }
                    }
                    if let winner = players.first(where: { $0.score == maxScore }) {
                        if let profilesIndex = profiles.firstIndex(where: { $0.id == winner.id }) {
                            profiles[profilesIndex].totalMatchWins += 1
                        }
                    }
                    saveProfiles()
                    players.removeAll()
                }
                Button("Cancel", role: .cancel){}
            } message:{
                Text("Are you sure you want to end this session and update players stats?")
            }
        }
    }
}



// struct for a player
struct Player: Codable, Identifiable{
    var id = UUID()
    var name: String
    var score: Int
}

struct PlayerProfile : Codable, Identifiable, Equatable {
    let id: UUID
    var name: String
    var totalMatchWins: Int
    var totalFramesWon : Int
    
    init(id: UUID, name: String, totalMatchWins: Int, totalFramesWon: Int) {
        self.id = id
        self.name = name
        self.totalMatchWins = totalMatchWins
        self.totalFramesWon = totalFramesWon
    }
}



#Preview {
    ContentView()
}
