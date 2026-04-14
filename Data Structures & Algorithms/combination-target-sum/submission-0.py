
from typing import List

class Solution:
    def combinationSum(self, nums: List[int], target: int) -> List[List[int]]:
        # Sort the numbers to make pruning easier
        nums.sort()
        
        result: List[List[int]] = []  # will store all valid combinations
        
        def dfs(start: int, remaining: int, path: List[int]) -> None:
            # If remaining is exactly 0, we found a valid combination
            if remaining == 0:
                result.append(list(path))  # add a copy of the current combination
                return
            
            # Iterate through candidates starting from the given index
            for i in range(start, len(nums)):
                current = nums[i]
                
                # If current number is greater than remaining, no need to continue
                if current > remaining:
                    break  # because nums is sorted, all further numbers will be too large
                
                # Choose the current number
                path.append(current)
                
                # Recurse with updated remaining, allowing reuse of current number (so we pass i)
                dfs(i, remaining - current, path)
                
                # Backtrack: remove the last number added
                path.pop()
        
        # Start DFS from index 0 with the full target and an empty path
        dfs(0, target, [])
        return result