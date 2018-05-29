*tools-browser
browserClass
	browserClass ifNil: [browserClass := self defaultBrowserClass].
	^browserClass