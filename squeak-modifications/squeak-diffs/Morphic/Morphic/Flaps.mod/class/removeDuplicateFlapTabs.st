shared flaps
removeDuplicateFlapTabs
	"Remove flaps that were accidentally added multiple times"
	"Flaps removeDuplicateFlapTabs"
	| tabs duplicates |
	SharedFlapTabs copy ifNil: [^self].
	tabs := SharedFlapTabs copy.
	duplicates := Set new.
	tabs do: [:tab | | same |
		same := tabs select: [:each | each wording = tab wording].
		same isEmpty not
			ifTrue: [
				same removeFirst.
				duplicates addAll: same]].
	SharedFlapTabs removeAll: duplicates