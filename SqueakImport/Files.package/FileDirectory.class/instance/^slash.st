path access
/ aString 
	"Answer a FileDirectory on a subdirectory named aString, of the receiver.  If there is already a file named aString in the receiver directory, answer its Entry."
	| dir |
	dir := FileDirectory on: (self fullNameFor: aString).
	^ dir exists
		ifTrue: [ dir ]
		ifFalse:
			[ self
				entryAt: aString
				ifAbsent: [ dir ] ]