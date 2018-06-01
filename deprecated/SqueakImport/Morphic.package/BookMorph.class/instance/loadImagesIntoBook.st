menu
loadImagesIntoBook
	"PowerPoint stores GIF presentations as individual slides named Slide1, Slide2, etc.
	Load these into the book.  mjg 9/99"

	| directory filenumber form newpage |
	directory :=DirectoryChooserDialog openOn: FileDirectory default label: 'Select the directory to load pages from'.
	directory ifNil: [^ self].

	"Start loading 'em up!"
	filenumber := 1.
	[directory fileExists: 'Slide' , filenumber asString] whileTrue: 
			[Transcript
				show: 'Slide' , filenumber asString;
				cr.
			Smalltalk bytesLeft < 1000000 
				ifTrue: 
					["Make some room"

					(self valueOfProperty: #url) isNil 
						ifTrue: [self savePagesOnURL]
						ifFalse: [self saveAsNumberedURLs]].
			form := Form 
						fromFileNamed: (directory fullNameFor: 'Slide' , filenumber asString).
			newpage := PasteUpMorph new extent: form extent.
			newpage addMorph: (self world drawingClass withForm: form).
			self pages addLast: newpage.
			filenumber := filenumber + 1].

	"After adding all, delete the first page."
	self goToPage: 1.
	self deletePageBasic.

	"Save the book"
	(self valueOfProperty: #url) isNil 
		ifTrue: [self savePagesOnURL]
		ifFalse: [self saveAsNumberedURLs]