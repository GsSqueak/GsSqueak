private
endOfLine: position
	"Redefined in subclasses using Paragraph support"
	| targetLine |
	targetLine := paragraph lines at: (paragraph lineIndexFor: position).
	^ targetLine = paragraph lastLine
		ifFalse: [ targetLine last ]
		ifTrue: [ targetLine last + 1 ]