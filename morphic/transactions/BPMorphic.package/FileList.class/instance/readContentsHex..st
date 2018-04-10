private
readContentsHex: brevity 
	"retrieve the contents from the external file unless it is too long.
	Don't create a file here. Check if exists."
	| _gsSqueakTemp_f _gsSqueakTemp_size _gsSqueakTemp_data _gsSqueakTemp_hexData _gsSqueakTemp_s |
	_gsSqueakTemp_f := directory oldFileOrNoneNamed: self fullName.
	_gsSqueakTemp_f == nil
		ifTrue: [^ 'For some reason, this file cannot be read' translated].
	_gsSqueakTemp_f binary.
	(_gsSqueakTemp_size := _gsSqueakTemp_f size) > 5000 & brevity
		ifTrue: [_gsSqueakTemp_data := _gsSqueakTemp_f next: 10000.
			_gsSqueakTemp_f close.
			brevityState := #briefHex]
		ifFalse: [_gsSqueakTemp_data := _gsSqueakTemp_f contentsOfEntireFile.
			brevityState := #fullHex].
	_gsSqueakTemp_s := WriteStream
				on: (String new: _gsSqueakTemp_data size * 4).
	0
		to: _gsSqueakTemp_data size - 1
		by: 16
		do: [:loc | 
			_gsSqueakTemp_s nextPutAll: loc printStringHex;
				 space;
				 nextPut: $(;
				 print: loc;
				 nextPut: $);
				 space;
				 tab.
			loc + 1
				to: (loc + 16 min: _gsSqueakTemp_data size)
				do: [:i | _gsSqueakTemp_s nextPutAll: (_gsSqueakTemp_data at: i) printStringHex;
						 space].
			_gsSqueakTemp_s cr].
	_gsSqueakTemp_hexData := _gsSqueakTemp_s contents.
	^ contents := _gsSqueakTemp_size > 5000 & brevity
				ifTrue: ['File ''{1}'' is {2} bytes long.
You may use the ''get'' command to read the entire file.

Here are the first 5000 characters...
------------------------------------------
{3}
------------------------------------------
... end of the first 5000 characters.' translated format: {fileName. _gsSqueakTemp_size. _gsSqueakTemp_hexData}]
				ifFalse: [_gsSqueakTemp_hexData]