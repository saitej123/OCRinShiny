
#Author: Sai Teja
#version: 1.0
#install.packages(c("shiny","jpeg","tesseract","wordcloud","tm","RColorBrewer","quanteda","DT"))

library(shiny)
library(jpeg)
library(tesseract)
library(wordcloud)
library(tm)
library(RColorBrewer)
library(quanteda)
library(DT)
library(koRpus)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("OCR App"),
  
  sidebarLayout(
    sidebarPanel(width = 3,
      
      fileInput('file1', 'Choose an image (max 4MB)'),
      tags$hr(),
      numericInput("maxwords", "Max number words in cloud",value=100),
      numericInput("minfreq", "Minimum word frequency in cloud", value=2),
      checkboxInput("stopwords", "Remove (English) stopwords", value = FALSE)
      
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(
        tabPanel(
          "Introduction",
          htmlOutput("intro")
        ),
        tabPanel(
          "Image & extracted text",
          fluidRow(
            column(
              width=7,
              imageOutput("plaatje")
            ),
            column(
              width=5,
              verbatimTextOutput("OCRtext")
            )
          )
        ),
          tabPanel(
          "Wordcloud",
          plotOutput("cloud", height = "800px")
        )
      )
    )
  )
))
