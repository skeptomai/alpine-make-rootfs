set -xe
sudo ./alpine-make-rootfs \
    --branch v3.8 \
    --arch "$1" \
    --packages 'ca-certificates openssl curl' \
    --timezone 'America/Los_Angeles' \
    --script-chroot \
    example-$(date +%Y%m%d).tar.gz - <<'SHELL'
        # Install some dev packages.
        apk add --no-progress --no-cache -t .make

        # Clean-up dev packages.  <7>
        apk del --no-progress .make
SHELL
