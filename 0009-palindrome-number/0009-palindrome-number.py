class Solution(object):
    def isPalindrome(self, x):
        """
        :type x: int
        :rtype: bool
        """
        if x<0:
            return False 
        chuoi=str(x)
        daonguoc= chuoi[::-1]
        return chuoi == daonguoc