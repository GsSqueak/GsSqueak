namespace
referenceSelectorFor: anObject 
	self class instVarNames
		do: [:aName | "Just those added in the unique subclass"
			(self instVarNamed: aName)
					== anObject
				ifTrue: [^ self referenceAccessorSelectorFor: aName]].
	^ self makeReferenceFor: anObject