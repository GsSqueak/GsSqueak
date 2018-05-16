private
validateCanMerge: aUserInterfaceTheme 
	(next notNil and:
		[ aUserInterfaceTheme next notNil and: [ next ~= aUserInterfaceTheme next ] ]) ifTrue: [ self error: 'Links to different themes.  Cannot merge.' ]