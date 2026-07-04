class Solution(object):
    def twoSum(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """
        da_nhin_thay={}
        for i , so in enumerate(nums):
            manhghep=target-so
            if manhghep in da_nhin_thay:
                return [da_nhin_thay[manhghep],i]
            da_nhin_thay[so]=i