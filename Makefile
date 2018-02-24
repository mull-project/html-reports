LAST_COMMIT_MESSAGE = $(shell git log --pretty=format:%s -n 1)

preview:
	hugo server

generate:
	hugo

clean:
	rm -rf public

setup:
	mkdir -p public
	cd public && git init .
	cd public && git remote add origin git@github.com:mull-project/html-reports.git
	cd public && git fetch origin && git checkout gh-pages
	cd public && git pull origin gh-pages

deploy: generate
	cd public && git add .
	cd public && git commit -a -m "$(LAST_COMMIT_MESSAGE)"
	cd public && git push origin gh-pages


