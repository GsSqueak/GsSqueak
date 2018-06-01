browse
browseClassCommentsWithString: aString
	"Smalltalk browseClassCommentsWithString: 'my instances' "
	"Launch a message list browser on all class comments containing aString as a substring."

	| caseSensitive suffix list |

	suffix := (caseSensitive := Sensor shiftPressed)
		ifTrue: [' (case-sensitive)']
		ifFalse: [' (use shift for case-sensitive)'].
	list := Set new.
	Cursor wait showWhile: [
		Smalltalk allClassesDo: [:class | 
			(class organization classComment asString findString: aString 
							startingAt: 1 caseSensitive: caseSensitive) > 0 ifTrue: [
								list add: (
									MethodReference
										class: class
										selector: #Comment
								)
							]
		]
	].
	^ self 
		browseMessageList: list sorted
		name: 'Class comments containing ' , aString printString , suffix
		autoSelect: aString