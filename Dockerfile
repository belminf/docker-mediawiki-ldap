FROM synctree/mediawiki
MAINTAINER Belmin Fernandez <me@iambelmin.com>

# LDAP requirements
RUN set -x; \
    apt-get update \
    && apt-get install -y libldap2-dev \
    && rm -rf /var/lib/apt/lists/*

# Install php ldap
RUN docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ \
    && docker-php-ext-install ldap

# Install LDAPAuthorization extension
RUN LDAPAUTH_EXT_DOWNLOAD_URL="https://extdist.wmflabs.org/dist/extensions/LDAPAuthorization-REL1_25-a599599.tar.gz"; \
    set -x; \
    mkdir -p /usr/src/mediawiki/extensions \
    && curl -fSL "$LDAPAUTH_EXT_DOWNLOAD_URL" -o ldapauth_ext.tar.gz \
    && tar -xf ldapauth_ext.tar.gz -C /usr/src/mediawiki/extensions --strip-components=1
