
shinyUI(fluidPage(

  shinyjs::useShinyjs(),

  titlePanel("Speed Math"),

  sidebarLayout(
    sidebarPanel(
      h3("Game Settings"),
      sliderInput(
        "max_number",
        "Number Range:",
        min = 0,
        max = 20,
        value = 10
      ),
      h4("Operators"),
      prettyCheckbox(inputId = "add", label = "+", status = "success", animation = "pulse", inline = TRUE),
      prettyCheckbox(inputId = "subtract", label = "-", status = "success", animation = "pulse", inline = TRUE),
      prettyCheckbox(inputId = "multiply", label = "x", status = "success", animation = "pulse", inline = TRUE),
      prettyCheckbox(inputId = "divide", label = "/", status = "success", animation = "pulse", inline = TRUE),
      br(),
      div(
        style = "text-align:center;",
        actionButton("start", "Start Playing!", style = 'padding:14px; font-size:150%; color:darkgreen')
      ),
      hr(),
      uiOutput("results")
    ),

    mainPanel(
      fluidRow(
        column(
          width = 4,
          uiOutput("problem"),
          uiOutput("solution")
        ),
        column(
          width = 6,
          textOutput("timer"),
          numericInput("answer", "Your Answer:", value = 0),
          actionButton("submit", "Submit")
        )
      )
    )
  )

))
