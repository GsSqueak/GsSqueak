typing/selecting keys
crWithIndent: aKeyboardEvent 
	"Replace the current text selection with CR followed by as many tabs
	as on the current line (+/- bracket count) -- initiated by Shift-Return."
	self addString: (String streamContents: [:characterStream | characterStream crtab: self tabCount]).  "Now inject CR with tabCount tabs"
	^ false