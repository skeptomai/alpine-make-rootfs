#!/bin/sh

./alpine-make-rootfs --branch v3.8 --packages 'ruby ruby-bigdecimal sqlite' --timezone 'America/Los_Angeles' --script-chroot example-$(date +%Y%m%d).tar.gz - <<'SHELL'  # (6)
        # Install some dev packages and gem mailcatcher.
        apk add --no-progress -t .make build-base ruby-dev sqlite-dev
        gem install --no-document mailcatcher

        # Clean-up dev packages.  (7)
        apk del --no-progress .make
SHELL
