set -xe
sudo ./alpine-make-rootfs \
    --branch v3.8 \
    --packages 'ruby ruby-bigdecimal sqlite ca-certificates openssl curl' \
    --timezone 'Europe/Prague' \
    --script-chroot \
    example-$(date +%Y%m%d).tar.gz - <<'SHELL'
        # Copy some file from the repository root to the rootfs.
        install -D -m 755 examples/hello_world.rb /app/hello_world.rb

        # Install some dev packages and gem mailcatcher.
        apk add --no-progress -t .make build-base ruby-dev sqlite-dev
        gem install --no-document mailcatcher

        # Clean-up dev packages.  <7>
        apk del --no-progress .make
SHELL
