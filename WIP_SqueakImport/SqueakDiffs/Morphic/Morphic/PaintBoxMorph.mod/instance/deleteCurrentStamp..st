actions
deleteCurrentStamp: evt 
	"The trash is telling us to delete the currently selected stamp"

	(tool arguments second) == #stamp: 
		ifTrue: 
			[stampHolder remove: tool.
			self setAction: #paint: evt: evt]	"no use stamping with a blank stamp"