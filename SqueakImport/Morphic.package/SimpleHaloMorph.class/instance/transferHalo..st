pop up
transferHalo: event
	"Transfer the halo to the next likely recipient"

	self target
		transferHalo: (event transformedBy: (self target transformedFrom: self))
		from: self target.