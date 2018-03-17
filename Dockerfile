
FROM fedora:latest
RUN dnf install -y \
  pandoc-pdf \
  texlive-euenc \
  texlive-fontspec \
  texlive-mathspec \
  && dnf clean all

WORKDIR /tmp

ENTRYPOINT ["/usr/bin/pandoc"]
