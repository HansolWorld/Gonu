import SwiftUI

struct ContentView: View {
    private let explanationText: String = "\"Gonu\" is a traditional Korean board game played on a board with a grid of lines. Players move pieces around the board to block their opponent's pieces or capture them all. Gonu is easier to learn than traditional Korean board games such as Janggi or Baduk, and can be played without any special equipment. The origins of Gonu are unclear, but artifacts with Gonu boards have been found dating back to the early Goryeo period. The name for the game varies depending on the region, with different names such as Gonu, Goni, Kkonni, or Kkonnun being used. There are many variations of the game, including Wellgonu, Pumpkingonu, and Fieldgonu, which differ in the number of pieces used and the rules of the game."
    
    var body: some View {
        GeometryReader { geometry in
            Rectangle()
                .fill(.white)
            VStack {
                Text("Gonu")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .bold()
                Spacer()
                Text(explanationText)
                    .font(.body)
                    .foregroundColor(.black)
                Spacer()
                HStack {
                    NavigationLink(destination: pumpkinGonu()) {
                        VStack {
                            Image("Pumpkin")
                                .resizable()
                            Text("Pumkin Gonu")
                        }
                    }
                    Spacer()
                    NavigationLink(destination: fieldGonu()) {
                        VStack {
                            Image("Field")
                                .resizable()
                            Text("Field Gonu")
                        }
                    }
                    Spacer()
                    NavigationLink(destination: wellGonu()) {
                        VStack {
                            Image("Well")
                                .resizable()
                            Text("Well Gonu")
                        }
                    }
                }
                .padding(50)
                .frame(height: geometry.size.height*2/3)
            }
            .padding(30)
        }
    }
}
