EXTRA_DIST += src/modules/shot/module.desktop \
src/modules/shot/e-module-shot.edj

if USE_MODULE_SHOT
shotdir = $(MDIR)/shot
shot_DATA = src/modules/shot/e-module-shot.edj \
	    src/modules/shot/module.desktop

shotpkgdir = $(MDIR)/shot/$(MODULE_ARCH)
shotpkg_LTLIBRARIES = src/modules/shot/module.la

nodist_src_modules_shot_module_la_SOURCES =
src_modules_shot_module_la_LIBADD = $(MOD_LIBS) @WAYLAND_LIBS@
src_modules_shot_module_la_CPPFLAGS = \
$(MOD_CPPFLAGS) @WAYLAND_CFLAGS@ -I$(top_builddir)/src/modules/shot
src_modules_shot_module_la_LDFLAGS = $(MOD_LDFLAGS)
src_modules_shot_module_la_SOURCES = \
src/modules/shot/e_mod_main.c

PHONIES += shot install-shot
shot: $(shotpkg_LTLIBRARIES) $(shot_DATA)
install-shot: install-shotDATA install-shotpkgLTLIBRARIES
endif
