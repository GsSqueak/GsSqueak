private
readContentsBrief: brevityFlag 
	"Read the contents of the receiver's selected file, unless it is too long,
	in which case show just the first 5000 characters. Don't create a file if
	it doesn't already exist."
	| _gsSqueakTemp_f _gsSqueakTemp_fileSize _gsSqueakTemp_first5000 |
	brevityFlag
		ifTrue: [directory isRemoteDirectory
				ifTrue: [^ self readServerBrief]].
	_gsSqueakTemp_f := directory oldFileOrNoneNamed: self fullName.
	_gsSqueakTemp_f
		ifNil: [^ 'For some reason, this file cannot be read' translated].
	_gsSqueakTemp_f
		converter: (self defaultEncoderFor: self fullName).
	(brevityFlag not
			or: [(_gsSqueakTemp_fileSize := _gsSqueakTemp_f size) <= 100000])
		ifTrue: [contents := _gsSqueakTemp_f contentsOfEntireFile.
			brevityState := #fullFile.
			"don't change till actually read"
			^ contents].
	"if brevityFlag is true, don't display long files when first selected"
	_gsSqueakTemp_first5000 := _gsSqueakTemp_f next: 5000.
	_gsSqueakTemp_f close.
	contents := 'File ''{1}'' is {2} bytes long.
You may use the ''get'' command to read the entire file.

Here are the first 5000 characters...
------------------------------------------
{3}
------------------------------------------
... end of the first 5000 characters.' translated format: {fileName. _gsSqueakTemp_fileSize. _gsSqueakTemp_first5000}.
	brevityState := #briefFile.
	"don't change till actually read"
	^ contents