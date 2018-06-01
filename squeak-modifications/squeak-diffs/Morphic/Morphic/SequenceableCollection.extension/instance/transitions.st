*Morphic-NewCurves-cubic support
transitions
	"Sent to a list of boolean values. 
	Return an OrderedCollection of transition indexes.  
	Indexes represent where the list elements transitions 
	from true to false
		or from false to true.
	1 is an index in the list iff the first element is false. "
	
	| changes boolSkip |

	changes := OrderedCollection new.
	boolSkip := true .
	
	self
		withIndexDo: [:truth :i | truth  == boolSkip
				ifFalse: [changes add: i.
					boolSkip := boolSkip not]].

	^ changes 