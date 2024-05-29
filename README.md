# Experimental TEI Stylesheets Docker Image

This is a **proof-of-concept, experimental, WIP, draft** (etc etc) docker image for running the TEI Stylesheets. There is little guarantee (or even expectation) that the below will work at the moment.

## Usage

### Using Docker

```bash

# First get the stuff from GitHub package registry (not yet in DockerHub)
docker pull ghcr.io/joeytakeda/docker-tei-stylesheets:main

# Now run this, mounting your current directory to the teic_home directory
docker run --rm -it `pwd`:/var/teic_home joeytakeda/docker-tei-stylesheets $COMMAND $INPUT [$OUTPUT]

```

Example:

```bash

# Convert a docx to TEI

docker run --rm -it `pwd`:/var/teic_home joeytakeda/docker-tei-stylesheets docxtotei myTestFile.docx

```

Note that this could be aliased (something like):

```bash
# ~/.bash_profile
alias transformtei="docker run --rm -it `pwd`:/var/teic_home joeytakeda/docker-tei-stylesheets"

# Wherever your files are
transformtei docxtotei myTestFile.docx

```

### GitHub Action

```yaml

on: [push]

jobs:
  test:
    runs-on: ubuntu-latest
    name: TEI Stylesheet Action Example
    steps:
        # Checkout the repository
      - name: Checkout
        uses: actions/checkout@v4

        # Now convert your ODD to RelaxNG
      - name: Convert ODD to RNG
        uses: joeytakeda/docker-tei-stylesheets # Runs this action 
        with:
          command: "teitorng"
          args: "--odd rel/path/to/ODD.odd" # yields rel/path/to/ODD.rng
      - name: "Convert TEI to HTML"
        uses: joeytakeda/docker-tei-stylesheets # Runs this action
        with:
          command: "teitohtml"
          args: "poem.xml my/website/poem.html"

```