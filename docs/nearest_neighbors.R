nearest_neighbors <- function(df, feat, doc=F) {
  inner_f <- function() {
    widely(
      ~ {
        y <- .[rep(feat, nrow(.)), ]
        res <- rowSums(. * y) / 
          (sqrt(rowSums(. ^ 2)) * sqrt(sum(.[feat, ] ^ 2)))
        
        matrix(res, ncol = 1, dimnames = list(x = names(res)))
      },
      sort = TRUE
    )}
  if (doc) {
    df |> inner_f()(doc, dimension, value) }
  else {
    df |> inner_f()(word, dimension, value)
  } |> 
    select(-item2)
}