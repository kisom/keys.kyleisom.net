# build and push a site using rawk
# usage: edit SITE and RHOST
# 	- Kyle Isom <coder@kyleisom.net>

# directory containing site source
SITE=site

# ensure RHOST has a trailing slash!
#     e.g. foo@spam:baz/
RHOST=port.tyrfingr.is:sites/keys/

TARGET="$(PWD)/$(SITE)"


### shouldn't need to modify anything below these lines ###

all:	site

site:
	rawk $(TARGET)

install: 
	rsync -auvz -e "ssh" --delete-after $(SITE).build/ $(RHOST)

up: 
	rsync -auvz -e "ssh" $(SITE).build/ $(RHOST)

clean:
	rm -rf $(SITE).build

buildclean:
	rm -rf $(SITE).build/*
	find . -iname .\*.\* -exec rm {} \;

deploy: buildclean site install

.PHONY: all clean site buildclean deploy

