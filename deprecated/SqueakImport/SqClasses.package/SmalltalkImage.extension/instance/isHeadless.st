*SqClasses-*SqClasses-*SqClasses-vm parameters
isHeadless
	"Answer whether the command-line specified to launch the VM headless."
	self optionsDo:
		[ : each | (#('display=none' '-headless' '-vm-display-null' ) includes: each) ifTrue: [ ^ true ] ].
	^ false
