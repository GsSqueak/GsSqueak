browsing
browseMessageCategory: aCategory inClass: aClass
	"Open a message category browser."
	
	^ SystemBrowser default
		newOnClass: aClass messageCategory: aCategory