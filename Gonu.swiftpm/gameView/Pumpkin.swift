//
//  Pumpkin.swift
//  Gonu
//
//  Created by apple on 2023/04/09.
//

import SwiftUI

struct pumpkinGonu: View {
    
    var body: some View {
        GeometryReader { geometry in
            Rectangle()
                .fill(.white)
            HStack {
                Game(name: "Pumpkin", pieceList: [
                    Piece(col: 0, row: 0, player: .white),
                    Piece(col: 1, row: 0, player: .white),
                    Piece(col: 2, row: 0, player: .white),
                    Piece(col: 0, row: 4, player: .black),
                    Piece(col: 1, row: 4, player: .black),
                    Piece(col: 2, row: 4, player: .black)
                ], mapLengthW: 2, mapLengthH: 4)
                .frame(width: geometry.size.width * 2/4)
                Spacer()
                VStack(alignment: .leading) {
                    Text("Pumpkin Gonu")
                        .font(.largeTitle)
                        .bold()
                    Text("How to play:")
                        .bold()
                    Text("1. Prepare three horses on each end and place each horse in the position as shown in the picture.")
                    Text("2. You can move the horse one step at a time along each line.")
                    Text("3. If you enter the circle, you cannot go out of the circle.")
                    Text("4. Take turns placing pieces on the board, and if you block the opponent's pieces and make it impossible to move, you win.")
                    Spacer()
                }
                .frame(width: geometry.size.width * 1/4)
                .foregroundColor(.black)
            }
            .padding(min(geometry.size.width/9, geometry.size.height/9))
        }
    }
}
