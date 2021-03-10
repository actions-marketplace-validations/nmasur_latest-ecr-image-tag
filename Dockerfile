# Adapted from: https://github.com/aws/aws-cli/blob/v2/docker/Dockerfile

FROM amazonlinux:2 as installer
ARG EXE_FILENAME=awscli-exe-linux-x86_64.zip
RUN yum update -y \
  && yum install -y unzip curl \
  && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "$EXE_FILENAME" \
  && unzip $EXE_FILENAME \
  && ./aws/install --bin-dir /aws-cli-bin/

FROM amazonlinux:2
RUN yum update -y \
  && yum install -y less groff jq \
  && yum clean all
COPY --from=installer /usr/local/aws-cli/ /usr/local/aws-cli/
COPY --from=installer /aws-cli-bin/ /usr/local/bin/
COPY entrypoint.sh /entrypoint.sh
WORKDIR /aws
ENTRYPOINT ["/entrypoint.sh"]
