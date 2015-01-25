library(shiny)

shinyUI(pageWithSidebar(
    headerPanel("Atmospheric carbon dioxide at Mauna Loa Observatory, Hawaii"),
    sidebarPanel(
        h4('Adjust Time Frame'),
        p('Use the slider below to change the starting year for the graph to be displayed and the corresponding calculation of the CO2 increase.'),
        sliderInput('year', 'Select the Starting Year',value = 1958, min = 1958, max = 2014, step = 1,format="###0"),
        h4("About"),
        p('The carbon dioxide data, measured as the mole fraction in dry air, on Mauna Loa constitute the longest record of direct measurements of CO2 in the atmosphere. They were started by C. David Keeling of the Scripps Institution of Oceanography in March of 1958 at a facility of the National Oceanic and Atmospheric Administration.'),
        p('The tool accesses the NOAA data records for up-to-date monthly mean measurements and the Shiny Package for User Interface creation. Mouse-over the data points in the graph to view the individual values.')
    ),
    mainPanel(
        h4('Over the selected timeframe, the atmospheric carbon dioxide at Mauna Loa Observatory increased by:'),
        verbatimTextOutput("diff"),
        p('The increase in atmospheric CO2 is calculated based on the difference in the average concentration over the first and last 12 measurements in the selected timeframe.'),
        htmlOutput("view")
    )
))
