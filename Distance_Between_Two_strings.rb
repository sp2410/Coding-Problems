def minDistance(a, b)
        
        if !a or !b 
            return 0
        end
        
        alen = a.size
        blen = b.size
        
        dparray = Array.new(alen+1){Array.new(blen+1)}
        
        count1, count2 = 0,0
        
        for i in 0..alen
            dparray[i][0] = count1
            count1 = count1+1
        end
        
        
        for j in 0..blen
            dparray[0][j] = count2
            count2 = count2+1
        end
        
        
        for i in 1..alen
            for j in 1..blen
                if a[i-1] == b[j-1]
                    dparray[i][j] = dparray[i-1][j-1]
                    #puts "hello"
                else
                    dparray[i][j] = [(dparray[i-1][j-1]+1),( dparray[i][j-1]+1), (dparray[i-1][j]+1)].min
                    #puts "ho"
                end
            end
        end
        
        return dparray[alen][blen]
    

    end
    
