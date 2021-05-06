//
//  ContentView.swift
//  SwiftUI-FriendsList
//
//  Created by bee on 2021/05/06.

import SwiftUI

struct Friend: Identifiable {
    let id: Int
    let name: String
}

struct ContentView: View {
    @State var count = 1
    @State var friends = [Friend(id: 1, name: "Friend 1")]
    var body: some View {
        
        VStack {
            VStack{
                Text("Friend List")
                if(count < 15){
                    Text("You have \(count) friends now.").font(.title2)
                }else{
                    Text("Grats! Many friends now 🎉").font(.title)
                }
                
                HStack{
                    Button(action:{
                        count = count + 1
                        friends.append(Friend(id: count, name: "Friend \(count)"))
                    }){
                        Text("add new Friend")
                    }
                }
                NavigationView{
                    List {
                        ForEach(friends) { friend in
                            NavigationLink(
                                destination: DetailView(friendCount:self.$count)){
                                Text("\(friend.name)")
                            }
                        }
                    }.navigationBarTitle(Text("Your friends List"))
                }
            }
            
        }
    }
    
}


struct DetailView: View{
    @Binding var friendCount: Int
    var body:some View{
        if(friendCount < 15){
            Text("You only have \(friendCount) friend")
        }else{
            Text("You have many friends 🎉")
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
