class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        // Convert the input strings to arrays for easy access by index
        let sArr = Array(s)
        let tArr = Array(t)

        // Handle edge cases up front: return "" if t is empty, s is empty, or t is longer than s
        if t.isEmpty || s.isEmpty || t.count > s.count {
            return ""
        }

        // Build a frequency map for the characters in t
        // This will tell us how many of each char we need to find in the sliding window
        var tCount: [Character: Int] = [:]
        for char in tArr { // Loop over every character in t
            tCount[char, default: 0] += 1 // Count the occurrences of each character
        }

        // windowCount will track the characters currently inside our sliding window
        var windowCount: [Character: Int] = [:]

        // required is the number of unique characters in t,
        // which we need to satisfy in our window
        let required = tCount.count

        // formed is how many unique characters in the current window
        // actually meet their required count
        var formed = 0

        // Track our best window found so far: (length, leftIndex, rightIndex)
        var minWindow: (Int, Int, Int) = (Int.max, 0, 0)

        // Start both pointers (left and right) at the start of the string
        var left = 0
        var right = 0

        // Move our right pointer across the string to expand the window
        while right < sArr.count {
            let char = sArr[right] // Get the new character added into the window

            windowCount[char, default: 0] += 1 // Increment this char in the window

            // If the char is in t, and we've hit the exact count needed, increment formed
            if let need = tCount[char], windowCount[char] == need {
                formed += 1
            }

            // When we have a valid window (formed == required), try to shrink it from the left side
            while left <= right && formed == required {
                // Check if this window is the smallest we've seen that satisfies requirements
                if (right - left + 1) < minWindow.0 {
                    minWindow = (right - left + 1, left, right)
                }

                // We're about to remove this character from our window
                let leftChar = sArr[left]
                windowCount[leftChar, default: 0] -= 1

                // If this char was a requirement and we've dropped below what's needed,
                // decrease formed since the window is no longer valid for that char
                if let need = tCount[leftChar], windowCount[leftChar]! < need {
                    formed -= 1
                }
                // Move left pointer forward to shrink window
                left += 1
            }
            // Expand the window to the right
            right += 1
        }

        // If we never found a valid window, return empty string
        if minWindow.0 == Int.max {
            return ""
        }

        // Otherwise, return the substring corresponding to the minimum window found
        let start = minWindow.1
        let end = minWindow.2
        return String(sArr[start...end])
    }
}