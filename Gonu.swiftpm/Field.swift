//
//  Field.swift
//  Gonu
//
//  Created by apple on 2023/04/09.
//

import SwiftUI


struct fieldGonu: View {
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Game(name: "Field", pieceList: [
                    Piece(col: 0, row: 0, player: .white),
                    Piece(col: 1, row: 0, player: .white),
                    Piece(col: 2, row: 0, player: .white),
                    Piece(col: 0, row: 2, player: .black),
                    Piece(col: 1, row: 2, player: .black),
                    Piece(col: 2, row: 2, player: .black)
                ], mapLengthW: 2, mapLengthH: 2)
                .frame(width: geometry.size.width * 2/4)
                Spacer()
                VStack(alignment: .leading) {
                    Text("field Gonu")
                        .font(.largeTitle)
                        .bold()
                    Text("How to play:")
                        .bold()
                    Text("1. Prepare three pieces each at both ends and place them on the board as shown in the picture.")
                    Text("2. Each piece can move one square at a time along the lines.")
                    Text("3. Take turns to move the pieces, and the player who blocks the opponent's pieces on one side and blocks the path wins.")
                    Spacer()
                }
                    .frame(width: geometry.size.width * 1/4)
            }
            .padding(min(geometry.size.width/9, geometry.size.height/9))
        }
    }
}
