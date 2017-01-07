EXTRA_DIST += src/modules/weather/module.desktop.in \
src/modules/weather/e-module-weather.edj

if USE_MODULE_WEATHER
weatherdir = $(MDIR)/weather
weather_DATA = src/modules/weather/e-module-weather.edj \
	     src/modules/weather/module.desktop


weatherpkgdir = $(MDIR)/weather/$(MODULE_ARCH)
weatherpkg_LTLIBRARIES = src/modules/weather/module.la

src_modules_weather_module_la_LIBADD = $(MOD_LIBS)
src_modules_weather_module_la_CPPFLAGS = $(MOD_CPPFLAGS) -DOPENWEATHERMAP_API_KEY=\"@openweathermap_api_key@\"
src_modules_weather_module_la_LDFLAGS = $(MOD_LDFLAGS)
src_modules_weather_module_la_SOURCES = \
src/modules/weather/config.c \
src/modules/weather/mod.c \
src/modules/weather/weather.c \
src/modules/weather/weather.h \
src/modules/weather/plugin.c \
src/modules/weather/plugin.h \
src/modules/weather/plugin_openweathermap.c \
src/modules/weather/plugin_openweathermap.h

PHONIES += weather install-weather
weather: $(weatherpkg_LTLIBRARIES) $(weather_DATA)
install-weather: install-weatherDATA install-weatherpkgLTLIBRARIES
endif
