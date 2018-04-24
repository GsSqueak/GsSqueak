accessing
at: anInteger 
	"Answer my element at index anInteger. at: is used by a knowledgeable
	client to access an existing element"

	| index |
	1 <= anInteger ifFalse: [ self errorNoSuchElement ].
	(index := anInteger + firstIndex - 1) <= lastIndex ifFalse: [ self errorNoSuchElement ].
	^array at: index