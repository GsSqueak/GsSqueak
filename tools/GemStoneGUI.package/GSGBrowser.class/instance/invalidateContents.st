contents
invalidateContents

	self hasMessageSelected
		ifTrue: [self editSelection: #editMessage]
		ifFalse: [
			self hasMessageCategorySelected
				ifTrue: [self editSelection: #newMessage]
				ifFalse: [
					self hasClassSelected
						ifTrue: [self editSelection: self selectedClassContent]
						ifFalse: [
							self hasSystemCategorySelected
								ifTrue: [self editSelection: #newClass]
								ifFalse: [self editSelection: #none]]]].
	super invalidateContents