objects from disk
convertToCurrentVersion: varDict refStream: smartRefStrm 
	"Convert the old to new step lists"
	self convertStepList.
	self convertAlarms.
	^ super convertToCurrentVersion: varDict refStream: smartRefStrm