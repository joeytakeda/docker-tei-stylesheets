FROM teic/jenkins
LABEL maintainer="Joey Takeda"

# For multiple build images
ARG STYLESHEETS_BRANCH=v7.55.0
ARG REPO=TEIC/Stylesheets

USER root

RUN git clone --single-branch --branch $STYLESHEETS_BRANCH https://github.com/$REPO /usr/local/share/xml/tei/stylesheet/

RUN mkdir /var/fop && curl https://dlcdn.apache.org/xmlgraphics/fop/binaries/fop-2.9-bin.tar.gz -o /var/fop/fop.tar.gz \
          && tar zxf /var/fop/fop.tar.gz -C /usr/local/bin/ --strip-components=2 \
          && chmod 755 /usr/local/bin/fop

# Now update PATH
ENV PATH="${PATH}:/usr/local/share/xml/tei/stylesheet/bin/"

RUN mkdir -p /tei

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

WORKDIR "/tei"

ENTRYPOINT ["/entrypoint.sh"]