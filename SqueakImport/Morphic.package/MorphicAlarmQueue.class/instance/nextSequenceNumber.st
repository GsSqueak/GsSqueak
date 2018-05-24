private
nextSequenceNumber

	(sequenceNumber := sequenceNumber + 1) = 16r3FFFFFFF ifTrue: [
		"Sequence number overflow... reassign sequence numbers starting at 1."
		heap sort.
		1 to: heap size do: [ :index |
			(heap at: index) sequenceNumber: index ].
		sequenceNumber := heap size + 1 ].
	^sequenceNumber