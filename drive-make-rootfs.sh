set -xe
sudo ./alpine-make-rootfs \
    --branch v3.8 \
    --arch "$1" \
    --packages 'ca-certificates openssl curl apk-tools build-base tini' \
    --timezone 'America/Los_Angeles' \
    --script-chroot \
    example-$(date +%Y%m%d).tar.gz - <<'SHELL'
        echo -e 'nameserver 8.8.8.8\nnameserver 2620:0:ccc::2' > /etc/resolv.conf
SHELL
