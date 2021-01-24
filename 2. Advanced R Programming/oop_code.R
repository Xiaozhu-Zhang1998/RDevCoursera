# Class ----
setClass("LongitudinalData",
         slots = list(id = "numeric",
                      visit = "numeric",
                      room = "character",
                      value = "numeric",
                      timepoint = "numeric"))
setClass("Subject",
         slots = list(id = "numeric",
                      visit = "numeric",
                      room = "character",
                      value = "numeric",
                      timepoint = "numeric"))
setClass("Summary",
         slots = list(ls = "list"))
setClass("Visit",
         slots = list(id = "numeric",
                      visit = "numeric",
                      room = "character",
                      value = "numeric",
                      timepoint = "numeric"))
setClass("Room",
         slots = list(id = "numeric",
                      visit = "numeric",
                      room = "character",
                      value = "numeric",
                      timepoint = "numeric"))



# Function make_LD ----
make_LD <- function(data){
  obj <- new("LongitudinalData", 
             id = data$id,
             visit = data$visit,
             room = data$room,
             value = data$value,
             timepoint = data$timepoint)
  return(obj)
}



# Generic functions ----
# print functions
setGeneric("print")
setMethod("print", c(x = "LongitudinalData"),
          function(x){
            cat("Longitudinal dataset with", 
                length(unique(x@id)), "subjects")
          })
setMethod("print", c(x = "Subject"),
          function(x){
            if(length(x@visit) == 0){ return(NULL) }
            else {cat("Subject ID:", x@id)}
          })
setMethod("print", c(x = "Summary"),
          function(x){
            cat("ID:", x@ls[[1]], end = '\n')
            if("data.frame" %in% class(x@ls[[2]])){
              print.data.frame(x@ls[[2]], digits = 7)
            }
            else {print(x@ls[[2]], digits = 3)}
          })
setMethod("print", c(x = "Room"),
          function(x){
            cat("ID:", x@id, end = '\n')
            cat("Visit:", x@visit, end = '\n')
            cat("Room:", x@room[1], end = '\n')
          })


# subject function
setGeneric("subject", function(x,n){
  standardGeneric("subject")
})
setMethod("subject", c(x = "LongitudinalData"),
          function(x, n){
            obj <- new("Subject", id = n, 
                       visit = x@visit[x@id == n],
                       room = x@room[x@id == n], 
                       value = x@value[x@id == n],
                       timepoint = x@timepoint[x@id == n])
            return(obj)
          })


# summary functions
setGeneric("summary", function(x){
  standardGeneric("summary")
})
setMethod("summary", c(x = "Subject"),
          function(x){
            d <- data.frame(visit = x@visit,
                            room = x@room,
                            value = x@value)
            d <- d %>% 
              group_by(room, visit) %>% 
              summarize(value = mean(value)) %>%
              spread(key = room, value = value, fill = NA) %>%
              ungroup()
            obj <- new("Summary", ls = list(x@id, d))
            return(obj)
          })
setMethod("summary", c(x = "Room"),
          function(x){
            s <- quantile(x@value)
            s <- c(s[1:3], mean(x@value), s[4:5])
            names(s) <- c("Min.", "1st Qu.", "Median", "Mean",
                          "3rd Qu.", "Max.")
            obj <- new("Summary", ls = list(x@id, s))
            return(obj)
          })


# visit function
setGeneric("visit", function(x,n){
  standardGeneric("visit")
})
setMethod("visit", c(x = "Subject"),
          function(x,n){
            obj <- new("Visit", id = x@id, 
                       visit = n,
                       room = x@room[x@visit == n], 
                       value = x@value[x@visit == n],
                       timepoint = x@timepoint[x@visit == n])
            return(obj)
          })


# room function
setGeneric("room", function(x,n){
  standardGeneric("room")
})
setMethod("room", c(x = "Visit"),
          function(x,n){
            obj <- new("Room", id = x@id, 
                       visit = x@visit,
                       room = n, 
                       value = x@value[x@room == n],
                       timepoint = x@timepoint[x@room == n])
            return(obj)
          })
