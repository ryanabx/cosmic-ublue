ARG FLAVOR=main
ARG BASE_IMAGE=quay.io/fedora-ostree-desktops/${FLAVOR}
ARG IMAGE_MAJOR_VERSION=40

FROM ${BASE_IMAGE}:${IMAGE_MAJOR_VERSION}

# Setup Copr repo
RUN wget https://copr.fedorainfracloud.org/coprs/ryanabx/cosmic-epoch/repo/fedora-40/ryanabx-cosmic-epoch-fedora-$(rpm -E %fedora).repo -O /etc/yum.repos.d/_copr_ryanabx-cosmic.repo

# Install cosmic desktop environment
RUN rpm-ostree install cosmic-epoch

# Install extras (currently just a power manager)
RUN rpm-ostree install tuned

RUN rpm-ostree cleanup -m && ostree container commit