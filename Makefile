# Build
build:
	docker build --tag daniel/cdo .

shell:
	docker run --entrypoint /bin/bash --rm -it -v $(datadir):/data daniel/cdo 