as yet unclassified
fieldList
	object ifNil: [ ^ OrderedCollection new].
	^ self baseFieldList ,
		(self objectSize <= (self i1 + self i2)
			ifTrue: [(1 to: self objectSize)
						collect: [:i | i printString]]
			ifFalse: [(1 to: self i1) , (self objectSize - (self i2-1) to: self objectSize)
						collect: [:i | i printString]])
"
OrderedCollection new inspect
(OrderedCollection newFrom: #(3 5 7 123)) inspect
(OrderedCollection newFrom: (1 to: 1000)) inspect
"