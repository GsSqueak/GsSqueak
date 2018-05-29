instance creation
fullOnClass: aClass selector: aSelector
	"Open a new full browser set to the class and selector."
	"Browser fullOnClass: Browser selector: #defaultWindowColor"

	^ self new
			setClass: aClass selector: aSelector;
			buildAndOpenFullBrowser