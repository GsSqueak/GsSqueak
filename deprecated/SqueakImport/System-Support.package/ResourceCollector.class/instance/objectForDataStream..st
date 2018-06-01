objects from disk
objectForDataStream: refStream
	"This should never happen; when projects get written they must be decoupled from the resource collector. If you get the error message below something is seriously broken."
	self error:'Cannot write resource manager'