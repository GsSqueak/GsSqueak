as yet unclassified
chooseOneJumpEnd

	^UIManager default
		chooseFrom: self allJumpEndStrings
		values: self allJumpEndStrings
		title: 'Possible jump ends'.
	
