change logging
addClass: class 
	"Include indication that a new class was created."

	class wantsChangeSetLogging ifFalse: [^ self].
	isolationSet ifNotNil:
		["If there is an isolation layer above me, inform it as well."
		isolationSet addClass: class].
	self atClass: class add: #new.
	self atClass: class add: #change.
	self addCoherency: class name