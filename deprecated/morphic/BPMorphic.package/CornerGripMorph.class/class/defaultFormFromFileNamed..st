handle settings
defaultFormFromFileNamed: aString 
	"If you dislike the alpha scale of the default handle, use this method to
	install a new one.
	File should be in a readable image format, and contain a 48x48 32bit
	radial gradient with color white.
	Use passiveColor: / activeColor: to change them after file is loaded, see
	initialize for an example"
	| _gsSqueakTemp_sourceStream |
	_gsSqueakTemp_sourceStream := WriteStream on: String new.
	_gsSqueakTemp_sourceStream nextPutAll: 'defaultForm';
		 nextPut: Character cr;
		 nextPut: Character cr;
		 nextPut: $^;
		 nextPut: $(;
		 nextPutAll: (ImageReadWriter formFromFileNamed: aString) storeString;
		 nextPut: $).
	self class compile: _gsSqueakTemp_sourceStream contents