initialization
delete
	(model notNil and: [ closeWindowSelector notNil ]) ifTrue: [ model perform: closeWindowSelector ].
	super delete