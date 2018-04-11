menu messages
findReplace
	self setSearchFromSelectionOrHistory; setReplacementFromHistory.
	(UIManager default request: 'Find what to replace?' initialAnswer: FindText)
		ifEmpty: [^ self]
		ifNotEmpty: [:find | (UIManager default
				request: ('Replace ''{1}'' with?' format: {find})
				initialAnswer: (ChangeText
						ifEmpty: [find]))
				ifEmpty: [^ self]
				ifNotEmpty: [:replace | 
					FindText := find.
					ChangeText := replace.
					self findReplaceAgainNow]]