image save/restore
checkImageVersionFrom: f startingAt: imageOffset 
	"Read and verify the image file version number and return true if the
	the given image file needs to be byte-swapped. As a side effect,
	position the file stream just after the version number of the image
	header. This code prints a warning and does a hard-exit if it cannot
	find a valid version number."
	"This code is based on C code by Ian Piumarta."
	| _gsSqueakTemp_version _gsSqueakTemp_firstVersion |
	"check the version number"
	self sqImageFile: f Seek: imageOffset.
	_gsSqueakTemp_version := _gsSqueakTemp_firstVersion := self getWord32FromFile: f swap: false.
	(self readableFormat: _gsSqueakTemp_version)
		ifTrue: [^ false].
	"try with bytes reversed"
	self sqImageFile: f Seek: imageOffset.
	_gsSqueakTemp_version := self getWord32FromFile: f swap: true.
	(self readableFormat: _gsSqueakTemp_version)
		ifTrue: [^ true].
	"Note: The following is only meaningful if not reading an embedded
	image "
	imageOffset = 0
		ifTrue: ["try skipping the first 512 bytes (prepended by certain Mac file
			transfer utilities)"
			self sqImageFile: f Seek: 512.
			_gsSqueakTemp_version := self getWord32FromFile: f swap: false.
			(self readableFormat: _gsSqueakTemp_version)
				ifTrue: [^ false].
			"try skipping the first 512 bytes with bytes reversed"
			self sqImageFile: f Seek: 512.
			_gsSqueakTemp_version := self getWord32FromFile: f swap: true.
			(self readableFormat: _gsSqueakTemp_version)
				ifTrue: [^ true]].
	"hard failure; abort"
	self print: 'This interpreter (vers. '.
	self printNum: self imageFormatVersion.
	self print: ') cannot read image file (vers. '.
	self printNum: _gsSqueakTemp_firstVersion.
	self print: ').'.
	self cr.
	self print: 'Press CR to quit...'.
	self getchar.
	self ioExitWithErrorCode: 1.
	^ false