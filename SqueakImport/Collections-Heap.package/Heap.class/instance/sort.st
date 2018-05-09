sorting
sort
	"Fully sort the heap. This method preserves the heap invariants and can thus be sent safely"

	| start end element originalIndexUpdateBlock |
	end := tally.
	"Temporarly remove indexUpdateBlock to speed up sorting."
	originalIndexUpdateBlock := indexUpdateBlock.
	indexUpdateBlock := nil.
	[ tally > 1 ] whileTrue: [
		element := array at: tally.
		array 
			at: tally put: (array at: 1);
			at: 1 put: element.
		tally := tally - 1.
		self downHeapSingle: 1 ].
	tally := end.
	start := 1.
	originalIndexUpdateBlock ifNil: [
		"The was no indexUpdateBlock; just reverse the elements"
		[ start < end ] whileTrue: [
			element := array at: start.
			array
				at: start put: (array at: end);
				at: end put: element.
			start := start + 1.
			end := end - 1 ].
		^self ].
	"Restore indexUpdateBlock, reverse the elements and update the indices."
	indexUpdateBlock := originalIndexUpdateBlock.
	start := 1.
	[ start < end ] whileTrue: [
		| endValue |
		element := array at: start.
		endValue := array at: end.
		array
			at: start put: endValue;
			at: end put: element.
		indexUpdateBlock
			value: endValue value: start;
			value: element value: end.
		start := start + 1.
		end := end - 1 ].
	start = end ifTrue: [ indexUpdateBlock value: (array at: start) value: start ]