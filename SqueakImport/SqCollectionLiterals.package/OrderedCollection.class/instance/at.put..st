accessing
at: anInteger put: anObject 
	"Put anObject at element index anInteger. at:put: cannot be used to
	append, front or back, to an ordered collection; it is used by a
	knowledgeable client to replace an element."

	| index |
	1 <= anInteger ifFalse: [ self errorNoSuchElement ].
	(index := anInteger + firstIndex - 1) <= lastIndex ifFalse: [ self errorNoSuchElement ].
	^array at: index put: anObject