fileIn/Out
objectForDataStream: refStrm
	| dp |
	"I am about to be written on an object file.  Write a reference to a class in Smalltalk instead."

	(refStrm insideASegment and: [self isSystemDefined not]) ifTrue: [
		^ self].	"do trace me"
	dp := DiskProxy global: self theNonMetaClass name selector: #class
			args: (Array new).
	refStrm replace: self with: dp.
	^ dp
