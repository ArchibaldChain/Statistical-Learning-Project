standardizing = function(x){
    n = dim(x)[1]
    x_ <- x
    for (j in 1:dim(x)[2]){
        x_bar = median(x[,j])
        for (i in 1:dim(x)[1]){
            sq = sum((x[i,]-x_bar)^2)
            x_[i,j] = x[i,j]/sqrt(1/n* sq)
        }
    }
    x_
}