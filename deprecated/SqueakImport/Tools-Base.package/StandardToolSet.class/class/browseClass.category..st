browsing
browseClass: aClass category: aCategory
	"Open a browser for a class selecting a given message category."
	
	^ SystemBrowser default
		fullOnClass: aClass
		category: aCategory