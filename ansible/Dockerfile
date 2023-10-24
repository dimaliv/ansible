ARG BUILDKIT_INLINE_CACHE
ARG PYHTON_BASE_IMAGE_VERSION

FROM python:${PYHTON_BASE_IMAGE_VERSION}-alpine
ARG ANSIBLE_VERSION
ARG ANSIBLE_LINT_VERSION
WORKDIR /ansible
RUN apk --no-cache add \
        ca-certificates \
        openssh-client \
        openssl \
        py3-pip \
        py3-cryptography \
        rsync \
        sshpass \
        zip \
        unzip \
        tar \
        git \
        yaml-dev \
        curl
RUN python -m pip install --upgrade pip --no-cache-dir && \
    apk --no-cache add --virtual .build-deps \
        python3-dev \
        libffi-dev \
        openssl-dev \
        build-base && \
    pip3 install --no-cache-dir \
        dnspython \
        hvac \
        jsondiff \
        netaddr \
        passlib[bcrypt] \
        pexpect \
        pyOpenSSL && \
    if [[ -z "${ANSIBLE_VERSION}" ]]; then \
        pip3 install --no-cache-dir ansible; \
    else \
        pip3 install --no-cache-dir ansible==${ANSIBLE_VERSION}; \
    fi && \
    if [[ -z "${ANSIBLE_LINT_VERSION}" ]]; then \
        pip3 install --no-cache-dir ansible-lint[community,yamllint]; \
    else \
        pip3 install --no-cache-dir ansible-lint[community,yamllint]==${ANSIBLE_LINT_VERSION}; \
    fi && \
    apk del .build-deps
CMD [ "ansible-playbook", "--version" ]
