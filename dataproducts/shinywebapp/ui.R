        library(shiny) 
shinyUI(
        pageWithSidebar(
                # Application title
                headerPanel("Solve the Puzzle!"),
                
                sidebarPanel(
                        numericInput('distance', 'Insert your answer here!!', 0) ,
                        submitButton('Submit')
                ), 
                
                 
                mainPanel(
                        p('Two trains X and Y (80 km from each other) are running towards each other on the same track with a speed of 40km/hr.'),
                        p('A bird starts from the train X and travels towards train Y with constant speed of 100km/hr. Once it reaches train Y, it turns and starts moving toward train X. It does this till the two trains collide with each other.') ,
                        p('What is the total distance traveled by the bird?'), 
                        
                        
                        h4('Your Answer:'), 
                        verbatimTextOutput("inputdistancevalue"),
                        
                        strong(verbatimTextOutput("answer"))
                        
                        
                )
                
        )   
)