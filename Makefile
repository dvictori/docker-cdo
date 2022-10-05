# Build
build:
	docker build --tag daniel/cdo .

shell:
	docker run --rm -it -v $(datadir):/data daniel/cdo bash