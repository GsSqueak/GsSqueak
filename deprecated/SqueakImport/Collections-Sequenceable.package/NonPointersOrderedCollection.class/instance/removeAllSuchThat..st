removing
removeAllSuchThat: aBlock 
	"Same as super without trying to store nil in the emptied slots of array."

	| n |
	n := firstIndex.
	firstIndex to: lastIndex do: [ :index |
		| element |
		(aBlock value: (element := array at: index)) ifFalse: [
			array at: n put: element.
			n := n + 1 ] ].
	lastIndex := n - 1