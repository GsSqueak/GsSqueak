file in/out
doArmsLengthCommand: aCommand

	"We are no longer the active project, so do it"

	[self perform: aCommand]
		ensure: [self enter: #specialReturn.	"re-enter me and forget the temp project"]

