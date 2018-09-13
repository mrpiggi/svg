
MAKESOURCE = $(MAKE) -C source

ifeq ($(OS),Windows_NT)
RM = del /Q /F
RD = rmdir /Q /S
MD = mkdir
CP = copy /Y
define rm_files
	$(foreach FILE,$(subst /,\,$(1)),
		$(shell if exist $(FILE) $(RM) $(FILE))
	)
endef
define rm_dirs
	$(foreach DIR,$(subst /,\,$(1)),
		$(shell if exist $(DIR) $(RD) $(DIR))
	)
endef
define mk_dirs
	$(foreach DIR,$(subst /,\,$(1)),
		$(shell if not exist $(DIR) $(MD) $(DIR))
	)
endef
define cp_files
	$(foreach FILE,$(subst /,\,$(1)),
		$(shell echo $(CP) $(FILE) $(subst /,\,$(2)))
	)
endef
else
# TODO check
RM = rm -f
RD = rm -f -r
MD = mkdir -p
CP = cp
define rm_files
	$(foreach FILE,$(1),$(RM) $(FILE))
endef
define rm_dirs
	$(foreach DIR,$(1),$(RD) $(DIR))
endef
define mk_dirs
	$(foreach DIR,$(1),$(MD) $(DIR))
endef
define cp_files
	$(foreach DIR,$(1),$(CP) $(DIR))
endef
endif

define copy_tds
	$(call mk_dirs,$(addprefix $(1),$(subst $(2),,$(TDS_DIRS))))
	$(call cp_files,$(DOC_FILES),$(addprefix $(1),$(subst $(2),,$(TDS_DOC_DIR))))
	$(call cp_files,$(MD_FILES),$(addprefix $(1),$(subst $(2),,$(TDS_DOC_DIR))))
	$(call cp_files,$(SRC_FILES),$(addprefix $(1),$(subst $(2),,$(TDS_SRC_DIR))))
	$(call cp_files,$(EXM_FILES),$(addprefix $(1),$(subst $(2),,$(TDS_EXM_DIR))))
	$(call cp_files,$(OUT_FILES),$(addprefix $(1),$(subst $(2),,$(TDS_TEX_DIR))))
endef

define rm_tds
	$(call rm_dirs,$(addprefix $(1),$(subst $(TDS_SUFFIX),,$(TDS_DIRS))))
endef

.PHONY: all $(PACKAGE) doc pdf mostlyclean clean distclean dist release zip install uninstall

# creates package files only
all:
	$(MAKESOURCE) all

# creates documentation only
doc: 
	$(MAKESOURCE) doc	
pdf: 
	$(MAKESOURCE) pdf

# removes all temporary files created with all or doc
mostlyclean:	
	$(MAKESOURCE) mostlyclean

# addtionally removes package files and documentation
clean:
	$(MAKESOURCE) clean
	
# creates TDS folder structure with generated files
dist:
	$(MAKESOURCE) dist
	
# removes TDS folder structure
distclean: 
	$(MAKESOURCE) distclean

# creates zip files for CTAN and GitHub from TDS folder structure
release:
	$(MAKESOURCE) release

# installs all files in TDS folder structur in TEXMF_HOME
install: 
	$(MAKESOURCE) install

# removes all installed files from TEXMF_HOME
uninstall:
	$(MAKESOURCE) uninstall
