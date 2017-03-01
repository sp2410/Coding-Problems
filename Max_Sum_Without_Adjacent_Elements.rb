class Solution
    # param a : array of array of integers
    #return an integer
    def adjacent(a)
        len = a[0].size
        
        if !a or len <1
            return 0
        end
        
        trana = a.transpose
        
        temp, incl, excl = 0, 0, 0
        
        
        for i in 0..(len-1)
            temp = incl
            #p trana[i]
            incl = [incl, trana[i].max + excl].max
            excl = temp
        end
        
        return incl
    end
end
