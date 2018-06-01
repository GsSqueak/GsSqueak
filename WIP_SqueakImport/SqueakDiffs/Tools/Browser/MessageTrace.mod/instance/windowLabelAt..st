private accessing
windowLabelAt: anInteger

	| str |
	^(str := autoSelectStrings at: anInteger)
		ifNil:
			[ 'Implementors of ',
				(self class
					parse: self selection
					toClassAndSelector: [ :class :selector | selector ]) ]
		ifNotNil:
			[ 'Senders of ', str ]
