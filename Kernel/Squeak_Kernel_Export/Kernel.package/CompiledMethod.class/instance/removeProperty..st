accessing-pragmas & properties
removeProperty: propName
	"Remove the property propName if it exists.
	 Do _not_ raise an error if the property is missing."
	| value newAdditionalState |
	value := self propertyValueAt: propName ifAbsent: [^nil].
	newAdditionalState := self penultimateLiteral copyWithout:
									(Association
										key: propName
										value: value).
	self penultimateLiteral: (newAdditionalState isEmpty
								ifTrue: [newAdditionalState selector]
								ifFalse: [newAdditionalState]).
	^value