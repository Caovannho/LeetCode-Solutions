class Solution(object):
    def romanToInt(self, s):
        """
        :type s: str
        :rtype: int
        """
        la_ma={
            'I':1,
            'V': 5,
            'X': 10,
            'L': 50,
            'C': 100,
            'D': 500,
            'M': 1000
        }
        tong=0
        n=len(s)
        for i in range(n):
            if i < n-1 and la_ma[s[i]]< la_ma[s[i+1]]:
                tong-=la_ma[s[i]]
            else:
                tong+=la_ma[s[i]]
        return tong 
