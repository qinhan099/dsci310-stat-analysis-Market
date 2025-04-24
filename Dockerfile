# 1. Use Rocker's R base image as our default image
FROM rocker/rstudio:4.4.2

# 2. Set Working Directory Properly for restore() commands to run, where it should be the place we stored our renv.lock file
WORKDIR /home/rstudio

# 3. Install system-wise dependencies to Ubuntu for fast-build && error avoiding; not R-level pacakge.
RUN apt-get update && apt-get install -yes \
zlib1g-dev \
libcurl4-openssl-dev \
libssl-dev \
libgit2-dev \
libxml2-dev \
pkg-config \
build-essential


# 4. COPY any files that need to be accessed before the RUN commands.
COPY renv.lock .

# 5. Install Renv first, then use renv to restore all the pacakges saved in renv.lock
RUN Rscript -e "install.packages('renv', repos='https://cran.rstudio.com')"
RUN Rscript -e "install.packages('pak', repos = 'https://r-lib.github.io/p/pak/dev/')" && \
    Rscript -e "pak::pak(c('dplyr', 'readxl', 'vroom'))"


# 6. copy .Rprofile and /renv folder to the WORKING DIRECTORY.
# COPY .Rprofile .
# COPY /renv /renv


# In R, we don't have to explicity specify the clean command.
# Optional- Fixing Permissions
RUN chown -R rstudio:rstudio /home/rstudio
RUN chmod -R 755 /home/rstudio

#github actions token: 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