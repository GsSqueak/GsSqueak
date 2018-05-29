morphic gui
forgetIt

	morphicWindow ifNotNil: [ morphicWindow delete ].
	mvcWindow ifNotNil: [ mvcWindow controller close ].
