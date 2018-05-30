translation data layout
setupLocaleDirs
	| dirs sepa localesDirName |
	sepa := FileDirectory slash.
	SystemDefaultLocaleDirs := nil.
	dirs := self systemDefaultLocaleDirs.
	localesDirName := 'locale'.
	dirs add:  (Smalltalk imagePath) , sepa , localesDirName.
	dirs add:  (Smalltalk vmPath) , sepa , localesDirName.
	^dirs