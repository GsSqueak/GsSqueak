squeaklets
moveAllButYoungest: young in: versions to: repository
	| all |
	"Specialized to files with names of the form 'aName_vvv.ext'.  Where vvv is a mime-encoded base 64 version number.  Versions is an array of file names tokenized into three parts (aName vvv ext).  Move the files by renaming them on the server."

	versions size <= young ifTrue: [^ self].
	all := (versions as: Array)
		replace: [ :each | { each. Base64MimeConverter decodeInteger: each second unescapePercents } ];
		sort: [ :a :b | a second < b second ];
		replace: [ :each | each first ].
	
	all from: 1 to: all size - young do: [:vv | | fName |
		fName := vv first, '_', vv second, '.', vv third.
		repository rename: self fullName,fName toBe: fName].
