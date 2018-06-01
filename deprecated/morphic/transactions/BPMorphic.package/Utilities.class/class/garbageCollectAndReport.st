miscellaneous
garbageCollectAndReport
	"Do a garbage collection, and report results to the user."
	| _gsSqueakTemp_reportString |
	_gsSqueakTemp_reportString := String
				streamContents: [:aStream | 
					aStream nextPutAll: Smalltalk bytesLeftString.
					Smalltalk
						at: #Command
						ifPresent: [:cmdClass | | cc | (cc := cmdClass instanceCount) > 0
								ifTrue: [aStream cr; nextPutAll: '(note: there are ' , cc printString , ' undo record(s) present in your
system; purging them may free up more space.)']]].
	self inform: _gsSqueakTemp_reportString