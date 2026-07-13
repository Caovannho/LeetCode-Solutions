class Solution(object):
    def longestCommonPrefix(self, strs):
        """
        :type strs: List[str]
        :rtype: str
        """
        if not strs:
            return ""
        strs.sort()
        first = strs[0]
        last = strs[-1]
        ans=""
        for i in range(min(len(first),len(last))):
            if first[i] != last[i]:
                return ans 
            ans+= first[i]
        return ans 
        

