menu
loadImagesIntoBook
	"PowerPoint stores GIF presentations as individual slides named Slide1,
	Slide2, etc.
	Load these into the book. mjg 9/99"
	| _gsSqueakTemp_directory _gsSqueakTemp_filenumber _gsSqueakTemp_form _gsSqueakTemp_newpage |
	_gsSqueakTemp_directory := ((StandardFileMenu oldFileFrom: FileDirectory default)
				ifNil: [^ nil]) directory.
	_gsSqueakTemp_directory isNil
		ifTrue: [^ nil].
	"Start loading 'em up!"
	_gsSqueakTemp_filenumber := 1.
	[_gsSqueakTemp_directory fileExists: 'Slide' , _gsSqueakTemp_filenumber asString]
		whileTrue: [Transcript show: 'Slide' , _gsSqueakTemp_filenumber asString;
				 cr.
			Smalltalk bytesLeft < 1000000
				ifTrue: ["Make some room"
					(self valueOfProperty: #url) isNil
						ifTrue: [self savePagesOnURL]
						ifFalse: [self saveAsNumberedURLs]].
			_gsSqueakTemp_form := Form
						fromFileNamed: (_gsSqueakTemp_directory fullNameFor: 'Slide' , _gsSqueakTemp_filenumber asString).
			_gsSqueakTemp_newpage := PasteUpMorph new extent: _gsSqueakTemp_form extent.
			_gsSqueakTemp_newpage
				addMorph: (self world drawingClass withForm: _gsSqueakTemp_form).
			self pages addLast: _gsSqueakTemp_newpage.
			_gsSqueakTemp_filenumber := _gsSqueakTemp_filenumber + 1].
	"After adding all, delete the first page."
	self goToPage: 1.
	self deletePageBasic.
	"Save the book"
	(self valueOfProperty: #url) isNil
		ifTrue: [self savePagesOnURL]
		ifFalse: [self saveAsNumberedURLs]