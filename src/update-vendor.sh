#!/bin/sh
cd myrustlib
rm -Rf vendor vendor.tar.xz
cargo vendor
tar cfJ vendor.tar.xz vendor
rm -Rf vendor
