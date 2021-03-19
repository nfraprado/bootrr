.PHONY: all

all:

all-install :=

define add-scripts
$(DESTDIR)$(prefix)/$1: $1
	@echo "INSTALL $$<"
	@install -D -m 755 $$< $$@

all-install += $(DESTDIR)$(prefix)/$1
endef

$(foreach v,$(wildcard boards/*),$(eval $(call add-scripts,$v)))
$(foreach v,$(wildcard helpers/*),$(eval $(call add-scripts,$v)))

install: $(all-install)

clean:
