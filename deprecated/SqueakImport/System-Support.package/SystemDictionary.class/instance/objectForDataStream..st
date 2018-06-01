objects from disk
objectForDataStream: refStrm
	| dp |
	"I am about to be written on an object file.  Write a reference to Smalltalk instead."

	dp := DiskProxy global: #Smalltalk selector: #globals
			args: #().
	refStrm replace: self with: dp.
	^ dp