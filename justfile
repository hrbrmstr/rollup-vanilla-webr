# This is a justfile (https://github.com/casey/just)

# install/update miniserve
install-miniserve:
  cargo install miniserve

# serve project (requires miniserve)
serve:
	miniserve \
		--header "Cache-Control: no-cache; max-age=1" \
		--header "Cross-Origin-Embedder-Policy: require-corp" \
		--header "Cross-Origin-Opener-Policy: same-origin" \
		--header "Cross-Origin-Resource-Policy: cross-origin" \
		--index index.html \
		.

# serve project (requires miniserve)
serve-build:
	miniserve \
		--header "Cache-Control: no-cache; max-age=1" \
		--header "Cross-Origin-Embedder-Policy: require-corp" \
		--header "Cross-Origin-Opener-Policy: same-origin" \
		--header "Cross-Origin-Resource-Policy: cross-origin" \
		--index index-r.html \
		build

# sync to host
rsync:
	rsync -avp ./build/ rud.is:~/rud.is/w/rollup-vanilla-webr/

# publish to GH
github:
	git add -A
	git commit -m "chore: lazy justfile commit" 
	git push

# be environmentally conscious
rollup:
	rm -rf build/
	npx rollup --config