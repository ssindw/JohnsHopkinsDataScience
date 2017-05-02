library(shiny) 

answer_f<-function(distance){
        ifelse(distance==100,"Wow! You got it right!","Well tried, but not there yet!")
}

shinyServer(
        function(input, output) {
                
                output$inputdistancevalue <- renderPrint({input$distance})
                output$answer <- renderPrint({answer_f(input$distance)})
        } 
)