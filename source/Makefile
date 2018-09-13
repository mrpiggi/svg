# package name
PACKAGE = svg
# formatting tools
LATEX = pdflatex
TEX = tex

include Makefile.utils

# source files and package version
SRC__FILE := $(PACKAGE).dtx
SRC_FILES := $(SRC__FILE) $(wildcard *.dtx) 
EXM_FILES := $(wildcard examples/*.tex) $(wildcard examples/*.svg) $(wildcard examples/*.c)
AUX_FILES := $(wildcard Makefile*) $(wildcard *.bat)
SRC_DIRS  := $(sort $(dir $(SRC_FILES) $(EXM_FILES) $(AUX_FILES)))
SRC_DIRS  := $(filter-out ./, $(SRC_DIRS))

VERSION := $(strip $(call get_version, $(SRC__FILE)))
$(info ------------------------------------------------)
$(info This is version $(VERSION) of package $(PACKAGE))
$(info ------------------------------------------------)

# created files
OUT_FILES := $(PACKAGE).sty $(PACKAGE)-extract.sty
DOC__FILE := $(PACKAGE).pdf
DOC_FILES := $(DOC__FILE)

# release files and folders, installation folder
MD_FILES    := $(wildcard ../*.md)
RLS_DIR     := ../release_$(VERSION)/
GIT_DIR     := $(RLS_DIR)GitHub/
CTAN_DIR    := $(RLS_DIR)CTAN/
TEXMF_HOME  := $(shell kpsewhich --var-value=TEXMFHOME)/
#
TDS_SUFFIX := latex/$(PACKAGE)/
TDS_DOC_DIR := doc/$(TDS_SUFFIX)
TDS_SRC_DIR := source/$(TDS_SUFFIX)
TDS_EXM_DIR := source/$(TDS_SUFFIX)examples/
TDS_TEX_DIR := tex/$(TDS_SUFFIX)
TDS_DIRS    := $(TDS_DOC_DIR) $(TDS_SRC_DIR) $(TDS_EXM_DIR) $(TDS_TEX_DIR)


# temporary directories which can be deleted in any case
TMP_DIRS := $(sort $(dir $(wildcard */)))
TMP_DIRS := $(filter-out $(SRC_DIRS), $(TMP_DIRS))
# temporary files which are created within source directories
TMP_FILES := $(wildcard *.* $(TMP_FILES))
TMP_FILES += $(foreach DIR,$(SRC_DIRS),$(wildcard $(DIR)*.*))
TMP_FILES := $(filter-out $(SRC_FILES) $(EXM_FILES) $(AUX_FILES) $(OUT_FILES) $(DOC_FILES), $(TMP_FILES))

.PHONY: all $(PACKAGE) doc pdf mostlyclean clean distclean dist release zip install uninstall

# creates package files only
all: $(PACKAGE)

$(PACKAGE): $(OUT_FILES)

%.sty: $(SRC__FILE)
	$(TEX) $<

# creates documentation only
doc: pdf

pdf: $(DOC__FILE)
	
$(DOC__FILE): $(SRC__FILE) $(SRC_FILES)
	$(MAKE) mostlyclean
	$(LATEX) --shell-escape "\def\tudfinalflag{}\input{$<}"
	$(LATEX) "\def\tudfinalflag{}\input{$<}"
	$(LATEX) --shell-escape "\def\tudfinalflag{}\input{$<}"
	$(LATEX) "\def\tudfinalflag{}\input{$<}"
	$(LATEX) "\def\tudfinalflag{}\input{$<}"
	$(LATEX) --shell-escape "\def\tudfinalflag{}\input{$<}"

# removes all temporary files created with all or doc
mostlyclean:	
	$(call rm_dirs,$(TMP_DIRS))
	$(call rm_files,$(TMP_FILES))

# addtionally removes package files and documentation
clean: mostlyclean
	$(call rm_files,$(OUT_FILES))
	$(call rm_files,$(DOC_FILES))
	
# creates TDS folder structure with generated files
dist: all doc
	$(call rm_dirs,$(RLS_DIR))
	$(call copy_tds,$(RLS_DIR))
	
# removes TDS folder structure
distclean: 
	$(call rm_tds,$(RLS_DIR))
	$(call rm_tds,$(GIT_DIR))
	$(call rm_dirs,$(CTAN_DIR)$(PACKAGE)/)

# creates zip files for CTAN and GitHub from TDS folder structure
release: all doc
	$(call rm_dirs,$(GIT_DIR))
	$(call copy_tds,$(GIT_DIR))
	$(call rm_dirs,$(CTAN_DIR))
	$(call copy_tds,$(CTAN_DIR)$(PACKAGE)/,$(TDS_SUFFIX))
	$(call cp_files,$(CTAN_DIR)$(PACKAGE)/$(subst $(TDS_SUFFIX),,$(TDS_DOC_DIR))README.md,$(CTAN_DIR)$(PACKAGE))
	$(MAKE) zip
	$(MAKE) distclean

zip: 
	cd $(GIT_DIR) && zip -r $(PACKAGE)_$(VERSION).zip *
	$(call rm_dirs,$(CTAN_DIR)$(PACKAGE)/$(subst $(TDS_SUFFIX),,$(TDS_TEX_DIR)))
	$(call rm_files,$(CTAN_DIR)$(PACKAGE)/$(subst $(TDS_SUFFIX),,$(TDS_DOC_DIR))README.md)
	cd $(CTAN_DIR) && zip -r $(PACKAGE).zip *

# installs all files in TDS folder structur in TEXMF_HOME
install: all doc
	$(call copy_tds,$(TEXMF_HOME))
	texhash

# removes all installed files from TEXMF_HOME
uninstall:
	$(call rm_dirs,$(addprefix $(TEXMF_HOME),$(TDS_DIRS)))
	texhash
