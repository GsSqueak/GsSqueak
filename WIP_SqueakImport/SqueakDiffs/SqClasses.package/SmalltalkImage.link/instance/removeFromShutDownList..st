snapshot and quit
removeFromShutDownList: aClass

	ShutDownList remove: aClass name ifAbsent: []
