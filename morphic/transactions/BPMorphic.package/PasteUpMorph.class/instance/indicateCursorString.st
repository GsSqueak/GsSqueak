menu & halo
indicateCursorString
	"Answer the string to be shown in a menu to represent the 
	whether-to-indicate-cursor status"
	^ (self indicateCursor
		ifTrue: ['<on>']
		ifFalse: ['<off>'])
		, 'indicate cursor' translated