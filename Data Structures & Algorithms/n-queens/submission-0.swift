class Solution {
    func solveNQueens(_ n: Int) -> [[String]] {
        // This will hold all valid solutions we find.
        var results: [[String]] = []
        
        // queens[row] = column index where the queen is placed in that row.
        var queens: [Int] = Array(repeating: -1, count: n)
        
        // Track which columns are already occupied by queens.
        var cols: [Bool] = Array(repeating: false, count: n)
        
        // There are (2 * n - 1) possible values for row - col,
        // but row - col can be negative, so we shift by (n - 1).
        let diagCount = 2 * n - 1
        var diag1: [Bool] = Array(repeating: false, count: diagCount) // main diagonal (row - col + offset)
        var diag2: [Bool] = Array(repeating: false, count: diagCount) // anti-diagonal (row + col)
        
        // Offset so that (row - col + offset) is always non-negative.
        let offset = n - 1
        
        // Recursive backtracking function to place queens row by row.
        func backtrack(_ row: Int) {
            // Base case: all rows have a queen placed
            if row == n {
                // Convert current queens array to board and add to results
                let board = buildBoard(from: queens, n: n)
                results.append(board)
                return
            }
            
            // Try placing a queen in each column of the current row
            var col = 0
            while col < n {
                // Compute diagonal indices
                let d1 = row - col + offset     // main diagonal index
                let d2 = row + col             // anti-diagonal index
                
                // If this column or diagonals are already under attack, skip
                if cols[col] == false && diag1[d1] == false && diag2[d2] == false {
                    // Place the queen here
                    queens[row] = col
                    cols[col] = true
                    diag1[d1] = true
                    diag2[d2] = true
                    
                    // Recurse to the next row
                    backtrack(row + 1)
                    
                    // Backtrack: remove the queen and unmark the attacks
                    queens[row] = -1
                    cols[col] = false
                    diag1[d1] = false
                    diag2[d2] = false
                }
                
                col += 1
            }
        }
        
        // Helper function to build the board representation from queen positions
        func buildBoard(from queens: [Int], n: Int) -> [String] {
            var board: [String] = []
            var row = 0
            while row < n {
                var rowChars: [Character] = []
                var col = 0
                while col < n {
                    if col == queens[row] {
                        rowChars.append("Q")
                    } else {
                        rowChars.append(".")
                    }
                    col += 1
                }
                let rowString = String(rowChars)
                board.append(rowString)
                row += 1
            }
            return board
        }
        
        // Kick off backtracking from the first row
        backtrack(0)
        
        // Return all valid solutions found
        return results
    }
}