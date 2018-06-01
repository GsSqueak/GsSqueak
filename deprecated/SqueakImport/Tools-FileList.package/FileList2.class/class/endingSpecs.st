blue ui
endingSpecs
	"Answer a collection of specs to build the selective 'find anything' tool called by the Navigator. This version uses the services registry to do so."
	"FileList2 morphicViewGeneralLoaderInWorld: World"
	| categories specs rejects |
	rejects := #(addFileToNewZip: compressFile: openInZipViewer: extractAllFrom: openOn:).
	categories := #(
		('Art' ('bmp' 'gif' 'jpg' 'jpeg' 'form' 'png' 'pcx' 'xbm' 'xpm' 'ppm' 'pbm'))
		('Morphs' ('morph' 'morphs' 'sp'))
		('Projects' ('extseg' 'project' 'pr'))
		('MIDI' ('mid' 'midi'))
		('Music' ('mp3'))
		('Movies' ('movie' 'mpg' 'mpeg' 'qt' 'mov'))
		('Flash' ('swf'))
	).

		"('Books' ('bo'))"
		"('Code' ('st' 'cs'))"
		"('TrueType' ('ttf'))"
		"('3ds' ('3ds'))"
		"('Tape' ('tape'))"
		"('Wonderland' ('wrl'))"
		"('HTML' ('htm' 'html'))"

	categories first at: 2 put: ImageReadWriter allTypicalFileExtensions.
	specs := OrderedCollection new.
	categories do: [ :cat | | catSpecs catServices okExtensions services |
		services := Dictionary new.
		catSpecs := Array new: 3.
		catServices := OrderedCollection new.
		okExtensions := Set new.

		cat second do: [ :ext | (FileList itemsForFile: (FileDirectory default fullPathFor: ('fred.',ext))) do: [ :i |
			(rejects includes: i selector) ifFalse: [
				okExtensions add: ext.
				services at: i label put: i ]]].
		services do: [ :svc | catServices add: svc ].
		services isEmpty ifFalse: [ 
			catSpecs at: 1 put: cat first;
				at: 2 put: okExtensions;
				at: 3 put: catServices.
			specs add: catSpecs ]
	].
	^specs
