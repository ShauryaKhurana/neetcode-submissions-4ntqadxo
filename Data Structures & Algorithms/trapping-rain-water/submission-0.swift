class Solution {
    func trap(_ height: [Int]) -> Int {
        // If there are less than 3 bars, no water can be trapped
        if height.count < 3 {
            return 0
        }
        let n = height.count
        // leftMax[i] will be the tallest bar from the left up to i
        var leftMax = [Int](repeating: 0, count: n)
        // rightMax[i] will be the tallest bar from the right up to i
        var rightMax = [Int](repeating: 0, count: n)
        
        // Fill leftMax
        leftMax[0] = height[0] // First bar is its own max
        for i in 1..<n {
            // For each bar, leftMax is max of itself and leftMax of previous
            leftMax[i] = max(leftMax[i-1], height[i])
        }
        
        // Fill rightMax
        rightMax[n-1] = height[n-1] // Last bar is its own max
        var i = n - 2
        while i >= 0 {
            // For each bar, rightMax is max of itself and rightMax of next
            rightMax[i] = max(rightMax[i+1], height[i])
            i -= 1
        }
        
        var totalWater = 0
        // Loop through each bar (except first and last, which can't trap water)
        for i in 1..<(n-1) {
            // Water trapped is min of leftMax and rightMax minus the bar's height
            let water = min(leftMax[i], rightMax[i]) - height[i]
            // Only add if water is positive
            if water > 0 {
                totalWater += water
            }
        }
        // Return the total water trapped
        return totalWater
    }
}