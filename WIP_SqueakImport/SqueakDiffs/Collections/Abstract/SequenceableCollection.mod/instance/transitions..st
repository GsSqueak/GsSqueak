*Morphic-NewCurves-cubic support
transitions: aSelectBlock
	"Sent to a list. Select block returns a boolean 
	Return an OrderedCollection of transition indexes.  
	Indexes represent where the list elements transitions 
	from true to false
		or from false to true.
	1 is an index in the list iff the first element tests false. "
	
	| changes boolSkip |

	changes := OrderedCollection new.
	boolSkip := true .
	
	self withIndexDo: 
		 [:e :i | (aSelectBlock value: e ) == boolSkip
				ifFalse: [changes add: i.
					boolSkip := boolSkip not]].

	^ changes 