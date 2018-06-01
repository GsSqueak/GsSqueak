fonts support
installFont
	"(Locale isoLanguage: 'ja') languageEnvironment installFont"
	self fontDownload.
	SARInstaller installSAR: self fontFullName