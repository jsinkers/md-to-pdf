FROM ubuntu:latest

LABEL "com.github.actions.name"="Markdown to PDF Generator"
LABEL "com.github.actions.description"="Create PDF files from Markdown."

RUN apt-get update
# set non-interactive installation
RUN export DEBIAN_FRONTEND=noninteractive
# install tzdata package
RUN apt-get install -y tzdata
# set timezone
ENV TZ=Australia/Melbourne
RUN ln -fs /usr/share/zoneinfo/%TZ /etc/localtime
RUN dpkg-reconfigure --frontend noninteractive tzdata
# install pandoc (can't use apt as this is an ancient version)
RUN apt-get -y install wget 
RUN apt-get -y install dpkg
RUN wget -O pandoc.deb https://github.com/jgm/pandoc/releases/download/2.9.2/pandoc-2.9.2-1-amd64.deb
RUN dpkg -i pandoc.deb
RUN apt-get -y install git
RUN apt-get -y install texlive-full
RUN apt-get -y install texlive-xetex

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
