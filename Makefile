build_dir = build
src_dir = src

sphinx_build = sphinx-build
sphinx_opts = -d $(build_dir)/doctrees $(src_dir)


all:
	mkdir -p $(build_dir)
	$(sphinx_build) -b man $(sphinx_opts) $(build_dir)/man
	@echo
	@echo "Build finished. The manual pages are in $(build_dir)/man."
.PHONY: all


clean:
	rm -rf $(build_dir)
.PHONY: clean
