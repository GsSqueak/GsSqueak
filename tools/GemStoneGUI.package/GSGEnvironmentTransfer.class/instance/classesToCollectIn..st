diffing
classesToCollectIn: anEnvironment

	self flag: #gss. "Should be based on system categories"
	^ anEnvironment classNames