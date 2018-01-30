accessing-pragmas & properties
removeProperty: propName ifAbsent: aBlock
	"Remove the property propName if it exists.
	 Answer the evaluation of aBlock if the property is missing."
	| value newAdditionalState |
	value := self propertyValueAt: propName ifAbsent: [^aBlock value].
	newAdditionalState := self penultimateLiteral copyWithout:
									(Association
										key: propName
										value: value).
	self penultimateLiteral: (newAdditionalState isEmpty
								ifTrue: [newAdditionalState selector]
								ifFalse: [newAdditionalState]).
	^value