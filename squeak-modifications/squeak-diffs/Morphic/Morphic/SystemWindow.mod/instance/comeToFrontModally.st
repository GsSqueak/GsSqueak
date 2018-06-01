top window
comeToFrontModally
	"If I am modal, bring along my modal owning window and my model child as well."

	super comeToFront.
	
	"Bring up my modal children in front of me."
	self modalChild ifNotNil: [:wnd | 
		wnd comeToFrontModally.
		wnd modalChild ifNil: [wnd flash]].