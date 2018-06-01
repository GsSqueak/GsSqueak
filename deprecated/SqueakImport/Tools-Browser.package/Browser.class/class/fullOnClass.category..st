instance creation
fullOnClass: aClass category: category
	"Open a new full browser set to class and message category."
	"Browser fullOnClass: Browser category: 'controls' "

	^ self new
			setClass: aClass;
			selectMessageCategoryNamed: category;
			buildAndOpenFullBrowser