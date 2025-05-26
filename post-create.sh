#!/bin/bash

# Update system packages
sudo apt-get update && sudo apt-get upgrade -y

# Install system dependencies for econometric packages
sudo apt-get install -y \
    libgsl-dev \
    libfftw3-dev \
    libxml2-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libnlopt-dev \
    cmake \
    pandoc \
    pandoc-citeproc

# Install R packages for econometrics
echo "Installing R packages..."
Rscript -e "
  # CRAN packages
  install.packages(c(
    'tidyverse', 'data.table', 'lubridate',
    'forecast', 'tseries', 'vars', 'urca',
    'fGarch', 'rugarch', 'rmgarch',
    'plm', 'fixest', 'broom',
    'stargazer', 'modelsummary', 'gt',
    'ggplot2', 'plotly', 'DT',
    'shiny', 'shinydashboard',
    'devtools', 'rmarkdown', 'knitr',
    'AER', 'sandwich', 'lmtest',
    'car', 'MASS', 'caret',
    'randomForest', 'glmnet',
    'quantmod', 'PerformanceAnalytics',
    'RcppArmadillo', 'RcppEigen'
  ), dependencies = TRUE)
  
  # GitHub packages
  devtools::install_github('rstudio/gt')
  devtools::install_github('vincentarelbundock/modelsummary')
"

# Install Python packages for econometrics
echo "Installing Python packages..."
pip install --upgrade pip
pip install \
    pandas numpy scipy matplotlib seaborn plotly \
    statsmodels scikit-learn \
    arch linearmodels \
    pymc3 arviz \
    jupyter jupyterlab \
    quarto-cli \
    yfinance pandas-datareader \
    openpyxl xlsxwriter \
    beautifulsoup4 requests \
    streamlit dash \
    black flake8 mypy \
    pytest pytest-cov

# Install Quarto
echo "Installing Quarto..."
wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.3.450/quarto-1.3.450-linux-amd64.deb
sudo dpkg -i quarto-1.3.450-linux-amd64.deb
rm quarto-1.3.450-linux-amd64.deb

# Setup Git configuration template
cat > ~/.gitconfig_template << EOF
[user]
    name = Your Name
    email = your.email@example.com
[core]
    editor = code --wait
[pull]
    rebase = false
[init]
    defaultBranch = main
EOF

# Create workspace directories
mkdir -p /workspace/{projects,data,papers,presentations,code-snippets}

# Create a sample R project structure
cat > /workspace/projects/.Rprofile << EOF
# Load common packages
suppressMessages({
  library(tidyverse)
  library(data.table)
  library(lubridate)
})

# Set options
options(
  repos = c(CRAN = "https://cran.rstudio.com/"),
  browserNLdisabled = TRUE,
  deparse.max.lines = 2,
  scipen = 999
)

# Custom functions for econometrics
source_if_exists <- function(file) {
  if (file.exists(file)) source(file)
}

cat("🎓 Econometrics Development Environment Ready!\n")
cat("📊 Loaded: tidyverse, data.table, lubridate\n")
cat("📁 Workspace: /workspace/\n")
EOF

# Create Python startup file
cat > /workspace/.pythonrc << EOF
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import statsmodels.api as sm
import statsmodels.formula.api as smf
from statsmodels.tsa.api import VAR, SVAR
import warnings
warnings.filterwarnings('ignore')

# Set plotting style
plt.style.use('seaborn-v0_8')
sns.set_palette("husl")

print("🐍 Python Econometrics Environment Ready!")
print("📊 Loaded: pandas, numpy, matplotlib, seaborn, statsmodels")
EOF

echo "export PYTHONSTARTUP=/workspace/.pythonrc" >> ~/.bashrc

# Create sample econometric analysis template
mkdir -p /workspace/templates
cat > /workspace/templates/econometric_analysis_template.R << EOF
# Econometric Analysis Template
# Author: [Your Name]
# Date: $(date +%Y-%m-%d)

# Load required packages
library(tidyverse)
library(AER)
library(stargazer)

# 1. Data Loading and Cleaning
# data <- read_csv("path/to/data.csv")

# 2. Exploratory Data Analysis
# summary(data)
# ggplot(data, aes(x = var1, y = var2)) + geom_point()

# 3. Model Specification
# model1 <- lm(y ~ x1 + x2, data = data)

# 4. Diagnostics
# plot(model1)
# lmtest::bptest(model1)  # Breusch-Pagan test
# car::vif(model1)        # Variance Inflation Factor

# 5. Results
# stargazer(model1, type = "text")

cat("Template loaded successfully!")
EOF

echo "✅ Development environment setup complete!"
echo "🎓 Ready for econometric analysis with R and Python!"
echo "📁 Templates available in /workspace/templates/" 