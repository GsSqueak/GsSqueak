private
errorNoSuchMember: aMemberName
	(self confirm: 'No member named ', aMemberName, '. Do you want to stop loading?')
		== true ifTrue: [ self error: 'aborted' ].