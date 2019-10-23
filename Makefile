.PHONY: default

default: solc-verify-examples.tar.gz

solc-verify-examples.tar: Dockerfile
	docker build -t solc-verify-examples .
	docker save solc-verify-examples -o solc-verify-examples
		
solc-verify-examples.tar.gz: solc-verify-examples.tar
	gzip solc-verify-examples.tar
