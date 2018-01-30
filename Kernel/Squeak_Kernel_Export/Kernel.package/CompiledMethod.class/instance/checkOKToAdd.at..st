source code management
checkOKToAdd: size at: filePosition
	"Issue several warnings if the end of the changes file is approaching
	a fixed size limit, and finally halt with an error if the limit is reached."

	^ SourceFiles checkOKToAdd: size at: filePosition
