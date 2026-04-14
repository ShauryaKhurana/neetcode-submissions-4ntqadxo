

class Solution:
    def hasDuplicate(self, nums: List[int]) -> bool:
        """dont brute force use hashmapsbruteforce uses  use extra time but lesser memory"""
        hashset= set()
        A= False
        for n in nums:
            if n in hashset:
                return True
                
            hashset.add(n)
        return False
