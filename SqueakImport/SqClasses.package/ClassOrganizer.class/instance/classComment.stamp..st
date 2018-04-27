accessing
classComment: aString  stamp: aStamp
	"Guards against setting the comment in a metaclass which is invalid"
	subject isMeta ifTrue:[^self error: 'Cannot set metaclass comments'].
	^super classComment: aString  stamp: aStamp