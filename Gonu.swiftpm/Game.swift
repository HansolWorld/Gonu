//
//  Game.swift
//  Gonu
//
//  Created by apple on 2023/04/09.
//

import SwiftUI


struct Game: View {
    private let gameName: String
    private let w: CGFloat
    private let h: CGFloat
    
    @State private var turnPlayer: Player
    @State private var showPosition:[[Int]]
    @State private var selectedPiece: Piece
    
    @State private var pieces: [Piece]
    
    init(name: String, pieceList: [Piece], mapLengthW: CGFloat, mapLengthH: CGFloat) {
        w = mapLengthW
        h = mapLengthH
        gameName = name
        turnPlayer = Player.white
        showPosition = []
        selectedPiece = Piece(col: 0, row: 0, player: .white)
        pieces = pieceList
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.white)
            GeometryReader { geometry in
                let circleW = geometry.size.width/10
                let circleH = geometry.size.height/10
                
                Image(gameName)
                    .resizable()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                
                ForEach(pieces, id: \.self) { piece in
                    Ellipse()
                        .fill(piece.player == Player.white ? .gray : .black)
                        .frame(width: circleW, height: circleH)
                        .offset(x: (CGFloat(piece.col)/w * geometry.size.width) - circleW/2,
                                y: (CGFloat(piece.row)/h * geometry.size.height) - circleH/2)
                        .onTapGesture {
                            self.showPosition = piece.checkPosition(gameName: gameName)
                            self.selectedPiece = piece
                        }
                }
                
                let nonOverlappingPositions = showPosition.filter { p in
                    !pieces.contains { $0.col == p[0] && $0.row == p[1] }
                }
                
                ForEach(nonOverlappingPositions, id: \.self) { p in
                    if turnPlayer == selectedPiece.player {
                        Ellipse()
                            .fill(.blue)
                            .opacity(0.5)
                            .frame(width: circleW, height: circleH)
                            .offset(x: (CGFloat(p[0])/w * geometry.size.width) - circleW/2,
                                    y: (CGFloat(p[1])/h * geometry.size.height) - circleH/2)
                            .onTapGesture {
                                self.pieces = self.pieces.map { piece in
                                    if piece.col == selectedPiece.col && piece.row == selectedPiece.row {
                                        return Piece(col: p[0], row: p[1], player: piece.player)
                                    } else {
                                        return piece
                                    }
                                }
                                self.turnPlayer = self.turnPlayer == Player.white ? Player.black : Player.white
                            }
                    }
                }
            }
            
            if pieces.filter({ $0.player == turnPlayer }).flatMap({ $0.checkPosition(gameName: gameName) }).filter({ position in
                !pieces.contains(where: { $0.col == position[0] && $0.row == position[1] })
            }).isEmpty {
                Text("\(turnPlayer == .white ? "Black" : "White") Player Win!")
                    .font(.largeTitle)
                    .bold()
            }
        }
    }
}
