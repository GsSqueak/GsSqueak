project window creation
openFromFile: fileName
	
	self flag: #bob.		"better not to use this one. nil directories are not nice.
						see #openFromDirectoryAndFileName: or 
						#openFromDirectory:andFileName: instead"

	self halt.

	Project canWeLoadAProjectNow ifFalse: [^ self].
	^ProjectLoading openFromDirectory: nil andFileName: fileName