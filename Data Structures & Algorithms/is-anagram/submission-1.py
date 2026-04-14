class Solution:
    def isAnagram(self, s: str, t: str) -> bool:

        
        
        return sorted(s)== sorted(t) # time inefficient but more memory efficient
        
      # " return Counter(s)==Counter(t)"# dont use counter method it only works in python & shortcut
       
       
       
        """if len(s) != len(t):
            return False

        countS, countT = {}, {}

        for i in range(len(s)):
            countS[s[i]] = 1 + countS.get(s[i], 0)
            countT[t[i]] = 1 + countT.get(t[i], 0)
        return countS == countT""" # use this unless memory optimization is asked 