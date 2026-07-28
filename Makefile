test:
	docker build --platform linux/amd64 --target builder -t my-server-builder .
	docker run --platform linux/amd64 --rm -it --entrypoint ctest my-server-builder --test-dir /app/build --output-on-failure