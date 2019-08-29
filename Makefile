# package name
PACKAGE = svg

MAKESOURCE = $(MAKE) -C source

.PHONY: $(PACKAGE) pdf all doc mostlyclean clean dist distclean release releaseclean install uninstall

$(PACKAGE):
	$(MAKESOURCE) $(PACKAGE)
pdf: 
	$(MAKESOURCE) pdf
all:
	$(MAKESOURCE) all
doc:
	$(MAKESOURCE) doc
mostlyclean:
	$(MAKESOURCE) mostlyclean
clean:
	$(MAKESOURCE) clean
dist:
	$(MAKESOURCE) dist
distclean: 
	$(MAKESOURCE) distclean
release:
	$(MAKESOURCE) release
releaseclean:
	$(MAKESOURCE) releaseclean
install: 
	$(MAKESOURCE) install
uninstall:
	$(MAKESOURCE) uninstall
