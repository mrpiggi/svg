# package name
PACKAGE = svg

MAKESOURCE = $(MAKE) -C source

.PHONY: all $(PACKAGE) pdf mostlyclean clean dist distclean release releaseclean install uninstall

all:
  $(MAKESOURCE) all
pdf: 
  $(MAKESOURCE) pdf
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

