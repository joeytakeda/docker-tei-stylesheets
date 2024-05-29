# Experimental TEI Stylesheets Docker Image

This is a proof-of-concept, experimental, WIP, draft (etc etc) docker image for running the TEI Stylesheets.


## Proposed use

```bash
docker run --rm -it `pwd`:/var/teic_home joeytakeda/docker-tei-stylesheets $COMMAND $INPUT [$OUTPUT]

```

Example:

```bash
docker run --rm -it `pwd`:/var/teic_home joeytakeda/docker-tei-stylesheets docxtotei myTestFile.docx

```

Note that this could be aliased (something like):

```bash
# ~/.bash_profile
alias transformtei="docker run --rm -it `pwd`:/var/teic_home joeytakeda/docker-tei-stylesheets"

# Wherever your files are
transformtei docxtotei myTestFile.docx

```