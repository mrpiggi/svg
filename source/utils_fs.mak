ifndef OSCONFIG
OSCONFIG=utils_os.mak
endif
include $(OSCONFIG)

ifdef win_utils
RM = del /Q /F
RD = rmdir /Q /S
MD = mkdir
CP = copy /Y
#MV = move /Y
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
define rm_files
  $(foreach FILE,$(subst /,\,$(1)),
    $(shell if exist $(FILE) $(RM) $(FILE))
  )
endef
define cp_files
  $(foreach FILE,$(subst /,\,$(1)),
    $(shell echo $(CP) $(FILE) $(subst /,\,$(2)))
  )
endef
#define mv_files
#  $(foreach FILE,$(subst /,\,$(1)),
#    $(shell echo $(MV) $(FILE) $(subst /,\,$(2)))
#  )
#endef
else
RM = rm -f
RD = rm -f -r
MD = mkdir -p
CP = cp
#MV = mv
define rm_dirs
  $(RD) $(1)
endef
define mk_dirs
  $(MD) $(1)
endef
define rm_files
  $(RM) $(1)
endef
define cp_files
  $(CP) $(1) $(2)
endef
#define mv_files
#  $(MV) $(1) $(2)
#endef
endif
