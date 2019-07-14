ifeq ($(OS),Windows_NT)
define get_rawversion
  $(shell findstr /r /c:"^  [1-9][0-9][0-9][0-9]/[0-9][0-9]/[0-9][0-9]" $(1))
endef
else
define get_rawversion
  $(shell grep "^  [1-9][0-9][0-9][0-9]/[0-9][0-9]/[0-9][0-9]" $(1))
endef
endif

define get_version
  $(subst %,,$(subst \space,,$(word 2, $(call get_rawversion,$(1)))))
endef

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

