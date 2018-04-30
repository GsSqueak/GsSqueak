public access
format: textOrStream in: aClass notifying: aRequestor decorated: aBoolean
	"Compile a parse tree from the argument, textOrStream. Answer a string containing the original code, formatted nicely.  If aBoolean is true, then decorate the resulting text with color and hypertext actions"
	| aNode |
	self from: textOrStream
		class: aClass
		notifying: aRequestor.
	aNode := self formatNoPattern: false ifFail: [^ nil].
	^ aBoolean
		ifTrue: [aNode decompileText]
		ifFalse: [aNode decompileString]