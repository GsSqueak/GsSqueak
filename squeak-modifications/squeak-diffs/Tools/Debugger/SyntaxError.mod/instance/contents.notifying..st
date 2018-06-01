other
contents: aString notifying: aController
	"Accept the code editions if syntax is correct.
	Then let the notification signalerContext proceed and restart compilation with these newSource."

	"In case of failure, return false so as to not accept the edits"
	notification reparse: aString notifying: aController ifFail: [^false].

	"else accept edits and proceed"
	aController hasUnacceptedEdits: false.
	self proceed