build_dir = build
man_build_dir = $(build_dir)/man
src_dir = src

sphinx_build = sphinx-build
sphinx_opts = -d $(build_dir)/doctrees $(src_dir)

pkg_version = 0.1.0
deb_dir = $(build_dir)/breaking-deps-man-$(pkg_version)

install_man_dir = /usr/share/man/man1


all:
	mkdir -p $(build_dir)
	$(sphinx_build) -b man $(sphinx_opts) $(man_build_dir)
	@echo
	@echo "Build finished. The manual pages are in $(build_dir)/man."
.PHONY: all


deb:
	mkdir -p $(deb_dir)/debian
	cp -Rf $(CURDIR)/deb/* $(deb_dir)/debian/
	mkdir -p $(deb_dir)/$(install_man_dir)
	cp $(man_build_dir)/* $(deb_dir)/$(install_man_dir)/
	cd $(deb_dir) ; dpkg-buildpackage -rfakeroot -uc -us
.PHONY: deb


clean:
	rm -rf $(build_dir)
.PHONY: clean
