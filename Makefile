# ---------------------------------------------------------------------------------------- #
# Makefile
# ---------------------------------------------------------------------------------------- #
SUBDIRS = $(shell ls -dC1 modules/*/ | sed 's/modules\///')


.PHONY: all clean $(SUBDIRS)

all: $(SUBDIRS)


$(SUBDIRS):
	@echo "Calling make for $@"
	@$(MAKE) -C modules/$@ -$(MAKEFLAGS)


test:
	@echo "Launching test target"
	@for dir in $(SUBDIRS); do \
		if [[ -d modules/$$dir ]]; then \
  		$(MAKE) -C modules/$$dir $@; \
		fi \
	done


clean:
	@echo "launching clean target"
	@for dir in $(SUBDIRS); do \
		if [[ -d modules/$$dir ]]; then \
  		$(MAKE) -C modules/$$dir $@; \
		fi \
	done
