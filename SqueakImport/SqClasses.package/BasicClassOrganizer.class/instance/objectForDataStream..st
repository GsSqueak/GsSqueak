fileIn/Out
objectForDataStream: refStrm
	| dp |
	"I am about to be written on an object file.  Write a path to me in the other system instead."

	self hasSubject ifTrue: [
		(refStrm insideASegment and: [self subject isSystemDefined not]) ifTrue: [
			^ self].	"do trace me"
		(self subject isKindOf: Class) ifTrue: [
			dp := DiskProxy global: self subject name selector: #organization args: #().
			refStrm replace: self with: dp.
			^ dp]].
	^ self	"in desparation"
