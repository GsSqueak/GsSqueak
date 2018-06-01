accessing
string: aString 
	string := aString.
	chars = 0
		ifTrue: 
			[chars := string size.
			self chars: chars].
	self stringToLed