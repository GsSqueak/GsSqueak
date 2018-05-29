instance creation
fullOnClass: aClass 
	"Open a new full browser set to class."
	"Browser fullOnClass: Browser"

	^ self new
			setClass: aClass;
			buildAndOpenFullBrowser