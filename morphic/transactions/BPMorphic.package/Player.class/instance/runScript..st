scripts-kernel
runScript: aSelector 
	"Called from script-activation buttons. Provides a safe way to run a
	script that may have changed its name"
	(self respondsTo: aSelector)
		ifTrue: [^ self triggerScript: aSelector].
	self inform: 'Oops, object "' , self externalName , '" no longer has
a script named "' , aSelector , '".
It must have been deleted or renamed.'