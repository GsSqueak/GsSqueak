exports
storeExportsOn: aFilename 
	"Store the exports on the given file"
	| s |
	[s := VMMaker forceNewFileNamed: aFilename] 
		on: FileDoesNotExistException 
		do:[^self couldNotOpenFile: aFilename].
	s nextPutAll: '/* '.
	s nextPutAll: VMMaker headerNotice.
	s nextPutAll: ' */'; cr.
	s nextPutAll:'/* This is an automatically generated table of all builtin modules in the VM */'; cr.
	s cr; nextPutAll:'extern sqExport vm_exports[];'.
	s cr; nextPutAll: 'extern sqExport os_exports[];'.
	self internalPluginsDo:[:cls|
		s cr; nextPutAll: 'extern sqExport '; nextPutAll: cls moduleName; nextPutAll:'_exports[];'.
	].
	s cr.

	s cr; nextPutAll:'sqExport *pluginExports[] = {'.
	s crtab; nextPutAll:'vm_exports,'.
	s crtab; nextPutAll: 'os_exports,'.
	self internalPluginsDo:[:cls|
		s crtab; nextPutAll: cls moduleName; nextPutAll:'_exports,'
	].
	s crtab; nextPutAll:'NULL'.
	s cr; nextPutAll:'};'; cr.
	s close