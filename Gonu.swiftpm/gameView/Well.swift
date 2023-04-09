//
//  Well.swift
//  Gonu
//
//  Created by apple on 2023/04/09.
//

import SwiftUI


struct wellGonu: View {

    var body: some View {
        GeometryReader { geometry in
            HStack {
                Game(name: "Well", pieceList: [
                    Piece(col: 1, row: 0, player: .white),
                    Piece(col: 2, row: 1, player: .white),
                    Piece(col: 0, row: 1, player: .black),
                    Piece(col: 1, row: 2, player: .black)
                ], mapLengthW: 2, mapLengthH: 2)
                .frame(width: geometry.size.width * 2/4)
                Spacer()
                VStack(alignment: .leading) {
                    Text("Well Gonu")
                        .font(.largeTitle)
                        .bold()
                    Text("How to play:")
                        .bold()
                    Text("1. Prepare two pieces of each side, and place them on the board as shown in the picture.")
                    Text("2. You can move one square at a time along the lines.")
                    Text("3. At the beginning, you cannot move 1 and 4, but you must move 2 and 3. The reason is that if you move these pieces first, you will block the path and be unable to play Gonu anymore.")
                    Text("4. Take turns placing pieces on the board, and if you block the opponent's pieces and make it impossible to move, you win.")
                    Spacer()
                }
                .frame(width: geometry.size.width * 1/4)
            }
            .padding(min(geometry.size.width/9, geometry.size.height/9))
        }
    }
}
