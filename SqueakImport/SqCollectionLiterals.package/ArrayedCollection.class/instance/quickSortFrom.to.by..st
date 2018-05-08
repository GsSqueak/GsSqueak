sorting
quickSortFrom: from to: to by: sortBlock
	"Sort elements i through j of self to be nondescending according to sortBlock using an in-place quicksort with simple median-of-three partitioning with guaranteed O(log(n)) space usage."

	| dij k l temp i j di dj n ij |
	i := from.
	j := to.
	[
		
		"The prefix d means the data at that index."
		"Sort di,dj."
		di := self at: i.
		dj := self at: j.
		(sortBlock ifNil: [ di <= dj ] ifNotNil: [ sortBlock value: di value: dj ]) ifFalse: [
			self at: i put: dj; at: j put: di. temp := dj. dj := di. di := temp "swap di with dj" ].
		(n := j + 1 - i) <= 2 ifTrue: [ ^self ].
		"More than two elements."
		dij := self at: (ij := i + j // 2). "ij is the midpoint of i and j. Sort di,dij,dj. Make dij be their median."
		(sortBlock ifNil: [ di <= dij ] ifNotNil: [ sortBlock value: di value: dij ])
			ifTrue: [
				(sortBlock ifNil: [ dij <= dj ] ifNotNil: [ sortBlock value: dij value: dj ]) ifFalse: [
					 "swap dij with dj, we don't need the value of the variable dj anymore"
					self at: j put: dij; at: ij put: dj. dij := dj ] ]
			ifFalse: [
				 "swap di with dij, we don't need the value of the variable di anymore"
				self at: i put: dij; at: ij put: di. dij := di ].
		n = 3 ifTrue: [ ^self ].
		"More than three elements."
		"Find k and l such that i<k<l<j and dk,dij,dl are in reverse order. Swap k and l. Repeat this procedure until k and l pass each other."
		k := i.
		l := j.
		[
			[ k <= (l := l - 1) and: [ 
				sortBlock ifNil: [ dij <= (self at: l) ] ifNotNil: [ sortBlock value: dij value: (self at: l) ] ] ] whileTrue.  "i.e. while dl succeeds dij"
			[ (k := k + 1) <= l and: [
				sortBlock ifNil: [ (self at: k) <= dij ] ifNotNil: [ sortBlock value: (self at: k) value: dij ] ] ] whileTrue.  "i.e. while dij succeeds dk"
			k <= l ] whileTrue: [ temp := self at: k. self at: k put: (self at: l); at: l put: temp. ].
		"Now l<k (either 1 or 2 less), and di through dl are all less than or equal to dk through dj. Sort the larger segment in this method and call another quicksort for the smaller segment. This ensures O(log(n)) space usage."
		i < l 
			ifFalse: [
				k < j
					ifFalse: [ ^self ]
					ifTrue: [ i := k ] ]
			ifTrue: [
				k < j
					ifFalse: [ j := l ]
					ifTrue: [
						l - i <  (j - k)
							ifTrue: [ 
								self quickSortFrom: i to: l by: sortBlock.
								i := k ]
							ifFalse: [
								self quickSortFrom: k to: j by: sortBlock.
								j := l ] ] ] ] repeat
