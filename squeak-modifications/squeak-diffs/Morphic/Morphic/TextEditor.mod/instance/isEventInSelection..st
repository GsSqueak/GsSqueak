events
isEventInSelection: evt
	"Check whether the event position is within the current selection."

	| pt a b |	
	self hasSelection ifFalse: [^ false].

	pt := evt position.
	a := self startBlock.
	b := self stopBlock.
	
	^ (pt >= a topLeft and: [pt <= b bottomLeft]) "Start and stop in same line"
		or: [
			a top < b top and: [ "Start and stop in different lines."
				((pt y > a bottom and: [pt y < b top]) "Fully selected lines in the middle."
					or: [pt x >= a left and: [pt y between: a top and: a bottom]]) "Top tail."
					or: [pt x <= b left and: [pt y between: b top and: b bottom]]]]. "Bottom tail."
	
	
	

	