//
//  Piece.swift
//  Gonu
//
//  Created by apple on 2023/04/09.
//

import SwiftUI

struct Piece: Hashable {
    var col: Int
    var row: Int
    let player: Player
    
    func checkPosition(gameName: String) -> [[Int]]{
        if gameName == "Field" {
            return checkFieldPosition()
        } else if gameName == "Well" {
            return checkWellPosition()
        } else {
            return checkPumpkinPosition()
        }
    }
    
    func checkFieldPosition() -> [[Int]] {
        var result:[[Int]] = [[col, row]]
        if col == 0 {
            if row == 0 {
                result = [[1, 0], [0, 1]]
            } else if row == 1 {
                result = [[0, 0], [0, 2], [1, 1]]
            } else if row == 2 {
                result = [[0, 1], [1, 2]]
            }
        } else if col == 1 {
            if row == 0 {
                result = [[0, 0], [1, 1], [2, 0]]
            } else if row == 1 {
                result = [[1, 0], [0, 1], [2, 1], [1, 2]]
            } else if row == 2 {
                result = [[0, 2], [1, 1], [2, 2]]
            }
        } else {
            if row == 0 {
                result = [[1, 0], [2, 1]]
            } else if row == 1 {
                result = [[2, 0], [1, 1], [2, 2]]
            } else if row == 2 {
                result = [[2, 1], [1, 2]]
            }
        }
        return result
    }
    
    func checkWellPosition() -> [[Int]] {
        var result: [[Int]] = [[col, row]]
        if col == 1  && row == 0{
            result = [[0, 1], [1, 1], [2, 1]]
        } else if col == 0 && row == 1 {
            result = [[1, 0], [1, 1], [1, 2]]
        } else if col == 1 && row == 1 {
            result = [[0, 1], [1, 0], [2, 1], [1, 2]]
        } else if col == 2 && row == 1 {
            result = [[1, 0], [1, 1]]
        } else {
            result = [[0, 1], [1, 1]]
        }
        
        return result
    }
    
    func checkPumpkinPosition() -> [[Int]] {
        var result: [[Int]] = [[col, row]]
        if col == 0 {
            if row == 0 {
                result = [[1, 0]]
            } else if row == 2 {
                result = [[1, 1], [1, 2], [1, 3]]
            } else if row == 4 {
                result = [[1, 4]]
            }
        } else if col == 1 {
            if row == 0 {
                result = [[0, 0], [1, 1] ,[2, 0]]
            } else if row == 1 {
                result = [[0, 2], [1, 2], [2, 2]]
            } else if row == 2 {
                result = [[1, 1], [0, 2], [2, 2], [1, 3]]
            } else if row == 3 {
                result = [[0, 2], [1, 2], [2, 2]]
            } else if row == 4 {
                result = [[0, 4], [1, 3], [2, 4]]
            }
        } else if col == 2 {
            if row == 0 {
                result = [[1, 0]]
            } else if row == 2 {
                result = [[1, 1], [1, 2], [1, 3]]
            } else if row == 4 {
                result = [[1, 4]]
            }
        }
        return result
    }
}
