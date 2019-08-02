RSE = function(y, x, beta){
    sqrt(RSS(y,x,beta)/(n-2))
}

R_square = function(y, x, beta){
    TSS = TSS(y)
    RSS = RSS(y, x, beta)
    return(1- RSS/TSS)
}
    
RSS = function(y, x, beta){
    y_hat = c()
    for (i in 1:length(y)){
       y_hat[i] = x[i,] * beta
    }
    return(sum((y-y_hat)^2))
}

TSS = function(y){
    sum((y - median(y))^2)
}