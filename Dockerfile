FROM haskell

# Set to Non-Interactive
ENV DEBIAN_FRONTEND noninteractive

# Install all TeX and LaTeX dependences
RUN apt-get update && \
  apt-get upgrade --yes && \
  apt-get install --yes --no-install-recommends \
  apt-utils

RUN apt-get update && apt-get install --yes --no-install-recommends \
  git \
  make \
  xz-utils \
  texlive-base \
  texlive-latex-base \
  texlive-fonts-recommended && \
  apt-get autoclean && \
  apt-get --purge --yes autoremove && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Pandoc
RUN stack upgrade && /root/.local/bin/stack install \
  pandoc

# Export the output data
WORKDIR /data
VOLUME ["/data"]

ENTRYPOINT ["pandoc"]

CMD ["--help"]
