#!/bin/sh

case "$1" in
    annoy)
        (test -f /proc/sys/fs/binfmt_misc/wine && echo 'binfmt has already been enabled') || docker run --privileged --rm cross-msvc bash -c 'update-binfmts --import wine && update-binfmts --enable wine && echo binfmt is enabled successfully'
        ;;
    *)
        test -f /proc/sys/fs/binfmt_misc/wine || docker run --privileged --rm cross-msvc bash -c 'update-binfmts --import wine && update-binfmts --enable wine'
        ;;
esac
