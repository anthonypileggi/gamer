library(shiny)

shinyServer(function(input, output, session) {

  rv <- reactiveValues(question = 0, active = FALSE, timer = 0)

  observeEvent(input$start, {
    rv$n1 <- sample(1:input$max_number, 1)
    rv$n2 <- sample(1:input$max_number, 1)
    rv$sign <- sample(c("+", "-"), 1)
    rv$answer <- eval(parse(text = paste(rv$n1, rv$sign, rv$n2)))
    rv$question <- 1
    rv$score <- 0
    rv$timer <- 120
    rv$active <- TRUE
  })

  # TODO: get this timer to work!
  observe({
    invalidateLater(1000, session)
    # if (rv$active)
    #   rv$timer <- rv$timer - 1
  })

  output$timer <- renderText({
    paste("Time Left:", lubridate::seconds_to_period(rv$timer))
  })

  # update in response to user submission
  observeEvent(input$submit, {

    # evaluate user response; update score
    cat(paste("answer =", rv$answer, "\nuser-answer =", input$answer))
    if (rv$answer == input$answer)
      rv$score <- rv$score + 1

    # generate a new problem
    rv$question <- rv$question + 1
    rv$n1 <- sample(1:input$max_number, 1)
    rv$n2 <- sample(1:input$max_number, 1)
    rv$sign <- sample(c("+", "-"), 1)
    rv$answer <- eval(parse(text = paste(rv$n1, rv$sign, rv$n2)))
  })

  output$problem <- renderUI({
    h2(
      style = "text-align:right",
      rv$n1,
      br(),
      rv$sign,
      rv$n2,
      hr()
    )
  })

  ans_color <- eventReactive(input$submit, {
    ifelse(
      rv$answer == input$answer,
      "red",
      "green"
    )
  })

  output$solution <- renderUI({
    h2(
      rv$answer,
      style =
        paste0("text-align:right; color:", ans_color())
      )
  })

  output$results <- renderUI({
    req(rv$question > 0)
    fluidRow(
      column(
        width = 6,
        h3("Questions"),
        h3(rv$question)
      ),
      column(
        width = 6,
        h3("Correct"),
        h3(paste0(rv$score, " (", round(100 * rv$score / rv$question), "%)"))
      )
    )
    # h4(
    #   paste("Questions:", rv$question),
    #   br(),
    #   paste0("Correct: ", rv$score, " (", round(100 * rv$score / rv$question), "%)")
    # )
  })

  observeEvent(input$submit, {
    shinyjs::show("solution")
    shinyjs::delay(3000, shinyjs::hide("solution"))
  })

})
