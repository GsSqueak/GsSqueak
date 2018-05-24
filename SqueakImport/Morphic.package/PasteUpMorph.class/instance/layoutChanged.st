layout
layoutChanged
	"The receiver's layout changed; inform above and below"
	super layoutChanged.
	(self valueOfProperty: #SqueakPage) ifNotNil: [
		self setProperty: #pageDirty toValue: true].
		"I am the morph of a SqueakPage, I have changed and 
		need to be written out again"
