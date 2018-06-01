*SqClasses-*SqClasses-*SqClasses-miscellaneous
objectForDataStream: refStrm
	| dp |
	"I am about to be written on an object file.  Write a reference to Smalltalk instead."

	dp := DiskProxy global: #Smalltalk selector: #yourself
			args: #().
	refStrm replace: self with: dp.
	^ dp
