accessing
at: index put: newObject
	"Heaps are accessed with #add: not #at:put:"
	^self shouldNotImplement