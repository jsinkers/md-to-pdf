FROM ubuntu:latest

LABEL "com.github.actions.name"="Markdown to PDF Generator"
LABEL "com.github.actions.description"="Create PDF files from Markdown."

RUN apt-get update
RUN apt-get -y install pandoc=2.9
RUN wget -O pandoc.deb https://github.com/jgm/pandoc/releases/download/2.9.2/pandoc-2.9.2-1-amd64.deb
RUN dpkg -i pandoc.deb
RUN apt-get -y install git
RUN apt-get -y install texlive-full
RUN apt-get -y install xelatex

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
