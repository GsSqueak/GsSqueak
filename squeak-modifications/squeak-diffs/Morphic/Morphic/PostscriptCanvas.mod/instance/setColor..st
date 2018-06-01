private
setColor: color 
	(color notNil and: [ currentColor ~= color ]) ifTrue:
		[ target write: color asColor.
		currentColor := color ]