squeaklet on server
loaderUrl
	"Return a url that will launch a project in a browser by composing a url like <loaderURL>?<projectURL>"
	^ Smalltalk namedArguments
		at: 'LOADER_URL'
		ifAbsent: [  ]