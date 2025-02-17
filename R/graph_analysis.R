library(igraph)

analyze_network <- function(data) {
  edges <- data.frame(from = data$user_id, to = data$in_reply_to_user_id)
  g <- graph_from_data_frame(edges, directed = TRUE)
  degree_centrality <- degree(g)
  closeness_centrality <- closeness(g)
  betweenness_centrality <- betweenness(g)
  centralities <- data.frame(node = V(g)$name, degree = degree_centrality, closeness = closeness_centrality, betweenness = betweenness_centrality)
  return(list(graph = g, centralities = centralities))
}
