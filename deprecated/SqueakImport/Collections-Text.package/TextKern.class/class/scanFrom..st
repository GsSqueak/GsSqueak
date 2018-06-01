fileIn/Out
scanFrom: strm
	| char k |
	char := strm next.
	char = $+
		ifTrue: [
			k := 1.
			[strm atEnd not and: [strm peek = char]]
				whileTrue: [strm next. k := k + 1].
			^ self kern: k].
	char = $-
		ifTrue: [
			k := -1.
			[strm atEnd not and: [strm peek = char]]
				whileTrue: [strm next. k := k - 1].
			^ self kern: k].
	self error: 'invalid identifier character'
			
	
