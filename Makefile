default: docker-integer-gmp docker-integer-simple

integer-gmp: | root/bin/sh root/lib/x86_64-linux-gnu/libc.so.6 root/lib/x86_64-linux-gnu/libdl.so.2 root/lib/x86_64-linux-gnu/libm.so.6 root/lib/x86_64-linux-gnu/libpthread.so.0 root/lib/x86_64-linux-gnu/librt.so.1 root/lib/x86_64-linux-gnu/libutil.so.1 root/lib/x86_64-linux-gnu/libz.so.1 root/lib64/ld-linux-x86-64.so.2 root/usr/lib/x86_64-linux-gnu/gconv/UTF-16.so root/usr/lib/x86_64-linux-gnu/gconv/UTF-32.so root/usr/lib/x86_64-linux-gnu/gconv/UTF-7.so root/usr/lib/x86_64-linux-gnu/gconv/gconv-modules root/usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache root/usr/lib/x86_64-linux-gnu/libgmp.so.10 root/lib/x86_64-linux-gnu/libnss_files.so.2 root/lib/x86_64-linux-gnu/libnss_dns.so.2 root/lib/x86_64-linux-gnu/libresolv.so.2 root/etc/protocols root/etc/services

integer-simple: | root/bin/sh root/lib/x86_64-linux-gnu/libc.so.6 root/lib/x86_64-linux-gnu/libdl.so.2 root/lib/x86_64-linux-gnu/libm.so.6 root/lib/x86_64-linux-gnu/libpthread.so.0 root/lib/x86_64-linux-gnu/librt.so.1 root/lib/x86_64-linux-gnu/libutil.so.1 root/lib/x86_64-linux-gnu/libz.so.1 root/lib64/ld-linux-x86-64.so.2 root/usr/lib/x86_64-linux-gnu/gconv/UTF-16.so root/usr/lib/x86_64-linux-gnu/gconv/UTF-32.so root/usr/lib/x86_64-linux-gnu/gconv/UTF-7.so root/usr/lib/x86_64-linux-gnu/gconv/gconv-modules root/usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache root/lib/x86_64-linux-gnu/libnss_files.so.2 root/lib/x86_64-linux-gnu/libnss_dns.so.2 root/lib/x86_64-linux-gnu/libresolv.so.2 root/etc/protocols root/etc/services

docker-integer-gmp: | integer-gmp
	@tar -cC root .|docker import - haskell-scratch:integer-gmp

docker-integer-simple: | integer-simple
	@tar -c --exclude=libgmp.so.10 -C root .|docker import - haskell-scratch:integer-simple

push:
	@docker tag haskell-scratch:integer-gmp skydome/haskell-scratch:integer-gmp
	@docker push skydome/haskell-scratch:integer-gmp
	@docker tag haskell-scratch:integer-simple skydome/haskell-scratch:integer-simple
	@docker push skydome/haskell-scratch:integer-simple
	@docker tag haskell-scratch:integer-simple skydome/haskell-scratch:latest
	@docker push skydome/haskell-scratch:latest

.PHONY: default docker-integer-gmp docker-integer-simple clean push
