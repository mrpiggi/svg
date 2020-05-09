win_utils = 
ifeq ($(OS),Windows_NT)
	ifneq ($(shell uname -o),Cygwin)
		win_utils = yes
	endif
endif
