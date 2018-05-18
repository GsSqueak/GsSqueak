resource download
downloadFonts  "BDFFontReader downloadFonts"
	"Download a standard set of BDF sources from x.org.  
	The combined size of these source files is around 1.2M; after conversion 
	to .sf2 format they may be deleted."

	| heads tails filenames baseUrl basePath |
	heads := #( 'charR' 'courR' 'helvR' 'lubR' 'luRS' 'lutRS' 'ncenR' 'timR' ).
	tails := #( '08' '10' '12' '14' '18' '24').

	filenames := OrderedCollection new.
	heads do: [:head |
		filenames addAll: (tails collect: [:tail | head , tail , '.bdf'])
	].
	baseUrl := 'http://cvsweb.xfree86.org/cvsweb/*checkout*/xc/fonts/bdf/75dpi/' asUrl.
	basePath := baseUrl path.

	filenames do: [:filename |
		| document newPath newUrl |
		newUrl := baseUrl shallowCopy.
		newPath := OrderedCollection newFrom: basePath.

		newPath addLast: filename.
		newUrl path: newPath.

		UIManager default informUser: 'Fetching ' , filename during: 
			[document := newUrl retrieveContents].

		MultiByteFileStream newFileNamed: filename do: [ :f |
			f 
				wantsLineEndConversion: true;
				nextPutAll: document content ]
	].
