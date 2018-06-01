printing
storeOn: t1 
	| t2 |
	t1 nextPutAll: '(('.
	t1 nextPutAll: self class name.
	t1 nextPutAll: ' newMethod: '.
	t1 store: self size - self initialPC + 1.
	t1 nextPutAll: ' header: '.
	t1 store: self header.
	t1 nextPut: $).
	t2 := self
				storeElementsFrom: self initialPC
				to: self endPC
				on: t1.
	1
		to: self numLiterals
		do: [:t3 | 
			t2
				ifTrue: [t2 := false]
				ifFalse: [t1 nextPut: $;].
			t1 nextPutAll: ' literalAt: '.
			t1 store: t3.
			t1 nextPutAll: ' put: '.
			t1
				store: (self literalAt: t3)].
	t2
		ifFalse: [t1 nextPutAll: '; yourself'].
	t1 nextPut: $)