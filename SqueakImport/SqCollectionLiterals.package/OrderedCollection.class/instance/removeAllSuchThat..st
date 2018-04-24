removing
removeAllSuchThat: aBlock 
	"Remove each element of the receiver for which aBlock evaluates to true.
	The method in Collection is O(N^2), this is O(N)."

	| n |
	n := firstIndex.
	firstIndex to: lastIndex do: [ :index |
		| element |
		(aBlock value: (element := array at: index)) ifFalse: [
			array at: n put: element.
			n := n + 1 ] ].
	array from: n to: lastIndex put: nil.
	lastIndex := n - 1