menu commands
readFromFile
	| _gsSqueakTemp_fileName |
	_gsSqueakTemp_fileName := UIManager default request: 'Please enter the image file name' initialAnswer: 'fileName'.
	_gsSqueakTemp_fileName isEmpty
		ifTrue: [^ self].
	self
		image: (Form fromFileNamed: _gsSqueakTemp_fileName)