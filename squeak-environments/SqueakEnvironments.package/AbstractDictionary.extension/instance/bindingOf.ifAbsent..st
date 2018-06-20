*SqueakEnvironments
bindingOf: varName ifAbsent: aBlock

	^self associationAt: varName ifAbsent: aBlock
