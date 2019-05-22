#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(plotly)
library(readxl)
IMPC_HEM_002_001 <- read_excel("IMPC_HEM_002_001.xlsx")
IMPC_HEM_002_001$data_point <- as.numeric(IMPC_HEM_002_001$data_point)
IMPC_HEM_002_001$date_of_experiment <- as.Date(IMPC_HEM_002_001$date_of_experiment)
IMPC_HEM_002_001$biological_sample_group[IMPC_HEM_002_001$biological_sample_group == "control"] <- "Wild Type"
IMPC_HEM_002_001$biological_sample_group[IMPC_HEM_002_001$biological_sample_group == "experimental"] <- "Knock Out"

IMPC_HEM_003_001 <- read_excel("IMPC_HEM_003_001.xlsx")
IMPC_HEM_003_001$data_point <- as.numeric(IMPC_HEM_003_001$data_point)
IMPC_HEM_003_001$date_of_experiment <- as.Date(IMPC_HEM_003_001$date_of_experiment)
IMPC_HEM_003_001$biological_sample_group[IMPC_HEM_003_001$biological_sample_group == "control"] <- "Wild Type"
IMPC_HEM_003_001$biological_sample_group[IMPC_HEM_003_001$biological_sample_group == "experimental"] <- "Knock Out"
                               
IMPC_HEM_004_001 <- read_excel("IMPC_HEM_004_001.xlsx")
IMPC_HEM_004_001$data_point <- as.numeric(IMPC_HEM_004_001$data_point)
IMPC_HEM_004_001$date_of_experiment <- as.Date(IMPC_HEM_004_001$date_of_experiment)
IMPC_HEM_004_001$biological_sample_group[IMPC_HEM_004_001$biological_sample_group == "control"] <- "Wild Type"
IMPC_HEM_004_001$biological_sample_group[IMPC_HEM_004_001$biological_sample_group == "experimental"] <- "Knock Out"
                             
IMPC_HEM_008_001 <- read_excel("IMPC_HEM_008_001.xlsx")
IMPC_HEM_008_001$data_point <- as.numeric(IMPC_HEM_008_001$data_point)
IMPC_HEM_008_001$date_of_experiment <- as.Date(IMPC_HEM_008_001$date_of_experiment)
IMPC_HEM_008_001$biological_sample_group[IMPC_HEM_008_001$biological_sample_group == "control"] <- "Wild Type"
IMPC_HEM_008_001$biological_sample_group[IMPC_HEM_008_001$biological_sample_group == "experimental"] <- "Knock Out"
                              
IMPC_HEM_027_001 <- read_excel("IMPC_HEM_027_001.xlsx")
IMPC_HEM_027_001$data_point <- as.numeric(IMPC_HEM_027_001$data_point)
IMPC_HEM_027_001$date_of_experiment <- as.Date(IMPC_HEM_027_001$date_of_experiment)
IMPC_HEM_027_001$biological_sample_group[IMPC_HEM_027_001$biological_sample_group == "control"] <- "Wild Type"
IMPC_HEM_027_001$biological_sample_group[IMPC_HEM_027_001$biological_sample_group == "experimental"] <- "Knock Out"
                             
# Define UI for application that draws a scatterplot and a boxplot
ui <- fluidPage(
    titlePanel("Knockout Phenotype Data Plots"),
    selectInput(
        inputId = 'Param',
        label = "Select a phenotype parameter:",
        choices = c(
            "Red blood cell count" = "IMPC_HEM_002_001",
            "Hemoglobin" = "IMPC_HEM_003_001",
            "Hematocrit" = "IMPC_HEM_004_001",
            "Platelet count" = "IMPC_HEM_008_001",
            "Red blood cell distribution width" = "IMPC_HEM_027_001"
        )),
    plotlyOutput(outputId = "scatterPlot"),
    plotlyOutput(outputId = "boxPlot")
    )
          
          
#Define functions to create scatterplot and boxplot in plotly   
server <- function(input, output) {
        output$scatterPlot <- renderPlotly ({
            ggplotly(ggplot(get(input$Param), aes(date_of_experiment, data_point, color = biological_sample_group, shape = sex)) +
            geom_point() +
                scale_colour_discrete(name  ="Genotype & Sex") +
                scale_shape_discrete(name  ="") +
            scale_x_date(date_breaks = "1 years", date_minor_breaks = "3 months", date_labels = "%Y (%b)") +
            labs(title = get(input$Param)$parameter_name[1], x = "Date", y = "Units"))

    })
        output$boxPlot <- renderPlotly ({
            ggplotly(ggplot(get(input$Param), aes(biological_sample_group, data_point, fill = biological_sample_group)) +
                geom_boxplot() +
                    theme(legend.position="none",  axis.title.x = element_blank()) +
                facet_wrap( ~ sex))
                })
}

# Run the application 
shinyApp(ui = ui, server = server)
