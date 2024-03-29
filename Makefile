# Makefile

BROWSER=/usr/bin/google-chrome-stable %u
HUGO=/usr/local/bin/hugo
SERVER_OPTIONS=-D -F

all: server

publish:
	rm -Rf docs
	$(HUGO)
	cd docs
	git add -u .
	git commit -m "publish"
	git push	


server: 
	killall hugo || true
	$(HUGO) $(SERVER_OPTIONS) server &
	#$(BROWSER) http://localhost:1313 &

clean:
	killall hugo