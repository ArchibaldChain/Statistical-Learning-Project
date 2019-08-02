RSE = function(y, x, beta){
    a = sqrt(RSS(y,x,beta)/(length(y)-2))
    print(a)
    return(a)
}

R_square = function(y, x, beta){
    TSS = TSS(y)
    RSS = RSS(y, x, beta)
    r = 1- RSS/TSS
    print(r)
    return(r)
}

Adjusted_R_square = function(y, x ,beta){
    TSS = TSS(y)
    RSS = RSS(y, x, beta)
    r = 1- RSS*(length(y)-1) / ((length(y)-1-length(beta))*TSS)
    print(r)
    return(r)
}
    
RSS = function(y, x, beta){
    y_hat = c()
    for (i in 1:length(y)){
        temp = 0
        for (j in 2: length(beta)){
            temp = temp + x[i,j-1] * beta[j]
        }
       y_hat[i] = temp + beta[1] 
    }
    return(sum((y-y_hat)^2))
}

TSS = function(y){
    sum((y - median(y))^2)
}