class Solution(object):
    def lengthOfLongestSubstring(self, s):
        """
        :type s: str
        :rtype: int
        s = "abca"
        s = "pwwkew"
        """
        ds={}
        do_dai_max=0
        bat_dau=0

        for i ,ds1 in enumerate(s):
            if ds1 in ds and ds[ds1]>=bat_dau :
                bat_dau=ds[ds1]+1
            ds[ds1]=i
            do_dai=i-bat_dau+1
            if do_dai>do_dai_max:
                do_dai_max=do_dai
        return do_dai_max
        

        