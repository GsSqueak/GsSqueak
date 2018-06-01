objects from disk
objectForDataStream: refStrm
	| dp |
	"I am about to be written on an object file.  Write a
reference to a known FontSet in the other system instead."

	"a path to me"
	dp := DiskProxy global: #TTCFont selector: #familyName:pointSize:emphasis:
			args: {self familyName. self pointSize. self emphasis}.
	refStrm replace: self with: dp.
	^ dp.
