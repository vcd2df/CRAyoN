# Hardcoding "noble" as both ubuntu and r version.
# Hardcoding latest quarto - this shouldn't matter unless R CMD check breaks (it's just docs)
# Don't see a graceful way to avoid 2x apt-get updates given the wget dependency.
# Unclear if both quarto installs are needed.

FROM ubuntu:noble

RUN apt-get update && apt-get install -y --no-install-recommends \ 
    wget \
    qpdf \
    texlive-latex-recommended \
    texlive-fonts-extra \
    tidy

RUN echo "deb https://cloud.r-project.org/bin/linux/ubuntu noble-cran40/" > /etc/apt/sources.list.d/ubuntu.list

RUN wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc

RUN apt-get update && apt-get install -y r-base 

RUN wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.7.32/quarto-1.7.32-linux-amd64.deb && dpkg -i quarto-1.7.32-linux-amd64.deb && rm quarto-1.7.32-linux-amd64.deb

RUN Rscript -e 'install.packages("quarto", repos="https://cloud.r-project.org")'
