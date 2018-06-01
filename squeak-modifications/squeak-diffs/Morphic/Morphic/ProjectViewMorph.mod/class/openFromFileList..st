project window creation
openFromFileList: fullName
	
	self flag: #bob.		"not sent??"

	self halt.

	^self openFromFile:  fullName