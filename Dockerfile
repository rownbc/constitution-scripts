FROM haskell

# Set to Non-Interactive
ENV DEBIAN_FRONTEND noninteractive

# Install all TeX and LaTeX dependences
RUN apt-get update && apt-get install --yes --no-install-recommends \
  ca-certificates \
  texlive-base \
  texlive-latex-base \
  texlive-fonts-recommended && \
  apt-get autoclean && \
  apt-get --purge --yes autoremove && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Pandoc
RUN stack upgrade && stack install \
  pandoc

# Set the locale
RUN dpkg-reconfigure locales
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Export the output data
WORKDIR /data
VOLUME ["/data"]

ENTRYPOINT ["pandoc"]

CMD ["--help"]
