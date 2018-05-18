sourcePointer conversion
checkOKToAdd: size at: filePosition
	"Issue several warnings as the end of the changes file approaches its limit,
	and finally halt with an error when the end is reached."

	^ self subclassResponsibility