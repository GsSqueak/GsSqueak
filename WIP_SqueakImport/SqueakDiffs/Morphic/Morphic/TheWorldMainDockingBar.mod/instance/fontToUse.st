private
fontToUse

	^ self userInterfaceTheme font ifNil: [TextStyle defaultFont]