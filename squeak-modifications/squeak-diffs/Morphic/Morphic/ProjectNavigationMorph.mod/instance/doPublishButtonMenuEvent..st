the actions
doPublishButtonMenuEvent: evt

	| selection |
	selection := UIManager default chooseFrom: {
		'Publish' translated.
		'Publish As...' translated.
		'Publish to Different Server' translated.
		 'edit project info' translated.
	} values: {
		[self publishProject].
		[self publishProjectAs].
		[self publishDifferent].
		[self editProjectInfo].
	} title:  'Publish options' translated.
	selection ifNil: [^self].
	selection value.

