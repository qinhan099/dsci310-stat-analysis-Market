# Title: Simple regression analysis for 1 simple ticker.
## Contributors/Authors: 
- Han Qin

## Project Summary:
This is a simple stat analysis report project follows the pipeline-styled structure. The dataset within this project is a sub-section of the true universe-market index. The pipelines reads in the historical data for the Utilities industry(NAICS-22). We then use simple OLS regression to estimate its linear coefficient and produce a linear regression report based on our findings.

## How to run the project:
### Option 1: Docker Run
Ensure you have docker desktop setup (V3.3.0 or later) is installed and running.
```R
# Clone this repository online
git clone https:
cd dsci310-stat-analysis-Markets

# Build the container and run analysis
docker build -t stat-analysis-Market
docker run --rm -v $PWD:/home/rstudio/project stat-analysis-Market make
```
### Option 2: Run Locally
1. Make sure you have R, Quarto, and pak installed.
2. Install dependencies with:
   ```R
   required_packages <- c(
  "tidyverse",
  "tidyr",
  "readr",
  "ggplot2",
  "broom",
  "readxl",
  "tibble",
  "vroom",
  "data.table",
  "DT",
  "IRdisplay",
  "magrittr"
  )
   pak::pak("required_packages")
   ```
3. Run the full analysis or manually render
run:
```R
make
``` 
manual render:
```R
quarto::quarto_render("analysis.qmd)
``` 

## List of Dependencies:
The following dependencies are required to run the project
- Docker
- Git
- R packages:
  - tidyverse
  - tidyr
  - readr
  - ggplot2
  - broom
  - readxl
  - tibble
  - vroom
  - data.table
  - DT
  - IRdisplay
  - magrittr

## License
This repository contains two types of licenses:

- Code assets (e.g., R scripts, Quarto files, functions in the R/ folder):
Licensed under the MIT License.
- Non-code assets (e.g., report text, figures, analysis results, data documentation): Licensed under the Creative Commons Attribution 4.0 International (CC BY 4.0).

This dual-licensing ensures that code can be reused freely with attribution, and non-code materials can be shared and adapted with proper credit.