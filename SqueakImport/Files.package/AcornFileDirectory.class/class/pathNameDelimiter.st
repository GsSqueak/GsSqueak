platform specific
pathNameDelimiter
"Acorn RiscOS uses a dot as the directory separator and has no real concept of filename extensions. We tried to make code handle this, but there are just too many uses of dot as a filename extension - so fake it out by pretending to use a slash. The file prims do conversions instead.
Sad, but pragmatic"
	^ $/
