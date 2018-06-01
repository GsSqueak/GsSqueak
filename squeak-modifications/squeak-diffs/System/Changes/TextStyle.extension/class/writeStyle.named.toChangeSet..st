*System-Changes-mime file in/out
writeStyle: aTextStyle named: familyName toChangeSet: csName
	"Write the text style to a change set, with a postscript that will re-load it.
	NOTE: to do TTCFonts, you have to have a working ShortPointArray endianness conversion."
	"
	TTCFont recreateCache.
	TextStyle writeStyle: (TextStyle named: #Arial) named: 'Arial' toChangeSet: 'ArialInstall'.
	
	TextStyle writeStyle: (TextStyle named: #Accuny) named: 'Accuny' toChangeSet: 'AccunyInstall2'.
	"

	| cs mime |

	cs := ChangeSet basicNewNamed: csName.
	cs adoptSelector: #collectionFromCompressedMIMEString: forClass: self class.
	cs adoptSelector: #replaceStyle:with: forClass: self class.
	cs adoptSelector: #replaceFontsIn:with: forClass: self class.
	cs adoptSelector: #looseFontsFromFamily: forClass: self class.
	((aTextStyle fontArray copyWithout: nil) collect: [ :f | f class ]) asSet do: [ :cls  | 
		cs adoptSelector: #derivativeFonts forClass: cls.
		cs adoptSelector: #releaseCachedState forClass: cls ].

	cs preambleString: (String streamContents: [ :s |
		s nextPutAll: '"Change Set:		'; nextPutAll: csName; cr;
		nextPutAll: 'Date:		'; print: Date today; cr;
		nextPutAll: 'Author:		'; nextPutAll: Utilities authorName; cr; cr;
		nextPutAll: 'Installs the text style '''; nextPutAll: familyName; nextPutAll: ''''; cr;
		nextPutAll: 'from a compressed MIME encoding in the postscript."'; cr. ]).

	mime := aTextStyle compressedMIMEEncoded.

	cs postscriptString: (String streamContents: [ :s | s
		nextPutAll: '"Postscript:'; cr;
		nextPutAll: 'Install the text style from the compressed MIME encoding, and replace the old one.';
		nextPut: $"; cr;
		nextPutAll: 'TextConstants at: #';
		nextPutAll: familyName;
		nextPutAll: ' ifPresent: [ :oldStyle | TextConstants at: #';
		nextPutAll: familyName;
		nextPutAll: 'OLD put: oldStyle. TextConstants removeKey: #';
		nextPutAll: familyName;
		nextPutAll: ' ].';
		cr;
		nextPutAll: 'TextStyle collectionFromCompressedMIMEString: ';
		cr;
		print: mime;
		nextPut: $.; cr; cr;
		nextPutAll: 'TextConstants at: #';
		nextPutAll: familyName;
		nextPutAll: 'OLD ifPresent: [ :oldStyle | TextStyle replaceStyle: oldStyle with: (TextStyle named: ''';
		nextPutAll: familyName;
		nextPutAll: ''') ].';
		cr;
		nextPutAll: 'TextStyle replaceFontsIn: (TextStyle looseFontsFromFamily: ''';
		nextPutAll: familyName;
		nextPutAll: ''') with: (TextStyle named: ''';
		nextPutAll: familyName;
		nextPutAll: ''').';		
		cr ]).

	cs fileOut.

