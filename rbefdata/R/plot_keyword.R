#' Vizualization functions to your BEFdata portal
#'
#' Vizalize the keywords contained in your BEFdata portal vai a nice wordcloud.
#' @param color_pal Is a color palette you can create for example with the color brewer
#' 	  package. See in the examples below. This defaults to brewer.pal(8,"Dark2").
#' @param min_freq I passed to the wordcloud function and delimits the minimum freqency
#' 	  the keyword needs to appear in the cloud. This defaults to 1.
#' @return The function returns a wordcloud based on the keywords of the BEFdata portal.
#' @examples
#' \dontrun{
#' require(RColorBrewer)
#' my_palette <- brewer.pal(8, "Dark2")
#' bef.portal.vizualize.keywords()
#' }
#' @import wordcloud
#' @import RColorBrewer
#' @export plot_keyword

plot_keyword <- function(color_pal = brewer.pal(8, "Dark2"), min_freq = 1) {
  keyword_table <- data.frame(get_keyword_stats(), stringsAsFactors = FALSE)
  wordcloud(keyword_table$keyword, keyword_table$dataset_count, scale = c(8, .2), min.freq = min_freq, max.words = Inf, random.order = FALSE, rot.per = .15, colors = color_pal)
}
