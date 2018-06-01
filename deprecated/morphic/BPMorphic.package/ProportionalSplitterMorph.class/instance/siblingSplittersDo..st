adjacent splitters
siblingSplittersDo: aBlock 
	owner
		ifNotNil: [owner
				submorphsDo: [:each | ((each isKindOf: self class)
							and: [self splitsTopAndBottom = each splitsTopAndBottom
									and: [each ~= self]])
						ifTrue: [aBlock value: each]]]