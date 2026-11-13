# Ubuntu with R. Other versions:
# https://rocker-project.org/images/versioned/r-ver.html
FROM rocker/r-ver:4.6.2

# libuv1-dev: the fs R package needs it (see renv::sysreqs())
RUN apt-get update && apt-get install --yes \
    curl \
    git \
    less \
    libuv1-dev \
    make \
    nano \
    openssh-server

# install quarto
# quarto comes with Typst for PDFs, so no LaTeX.
# dpkg --print-architecture: amd64 or arm64, to match your computer.
RUN curl --location --output quarto.deb \
    https://github.com/quarto-dev/quarto-cli/releases/download/v1.11.9/quarto-1.11.9-linux-$(dpkg --print-architecture).deb \
  && apt-get install --yes ./quarto.deb \
  && rm quarto.deb

# install python uv
# https://docs.astral.sh/uv/guides/integration/docker/#installing-uv
COPY --from=ghcr.io/astral-sh/uv:0.13.7 /uv /uvx /usr/local/bin/

# The project is mounted over /workspace, so the packages go in /opt
WORKDIR /workspace

# python packages in /opt/venv
ENV UV_PROJECT_ENVIRONMENT=/opt/venv
# ssh logins don't see ENV, only /etc/environment
RUN echo "UV_PROJECT_ENVIRONMENT=$UV_PROJECT_ENVIRONMENT" >> /etc/environment
COPY pyproject.toml uv.lock .python-version ./
# --locked: stop if uv.lock doesn't match pyproject.toml
RUN uv sync --locked

# R packages in /opt/renv/library
RUN echo "RENV_PATHS_LIBRARY=/opt/renv/library" >> /usr/local/lib/R/etc/Renviron.site
COPY renv.lock .Rprofile ./
COPY renv/activate.R renv/
RUN Rscript -e "renv::restore()"

# For linux laptops:
# StrictModes no: sshd wants root to own the key file,
# but on Linux the mounted one is yours
# RUN echo "StrictModes no" > /etc/ssh/sshd_config.d/container.conf

# -D: stay in the foreground, so the container keeps running
CMD ["/usr/sbin/sshd", "-D"]
