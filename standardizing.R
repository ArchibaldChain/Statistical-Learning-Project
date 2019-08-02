standardizing = function(x0){
    temp = x0[,4]
    x = x0[,-4]
    n = dim(x)[1]
    p = dim(x0)[2]
    x_ <- x
    for (j in 1:dim(x)[2]){
        x_bar = median(x[,j])
        for (i in 1:dim(x)[1]){
            sq = sum((x[i,]-x_bar)^2)
            x_[i,j] = x[i,j]/sqrt(1/n* sq)
        }
    }
    x_ = cbind(x_[,1:3], temp, x_[,4:p-1])
}