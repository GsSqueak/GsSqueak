fileIn
fileInFrom: stream
	"The zip has been saved already by the download.
	Read the zip into my instvar, then file in the correct members"

	

	[ | postscript preamble |
		stream position: 0.
		zip := ZipArchive new readFrom: stream.

		preamble := zip memberNamed: 'install/preamble'.
		preamble ifNotNil: [
			preamble contentStream text setConverterForCode fileInFor: self announcing: 'Preamble'.
			self class currentChangeSet preambleString: preamble contents.
		].

		postscript := zip memberNamed: 'install/postscript'.
		postscript ifNotNil: [
			postscript contentStream text setConverterForCode fileInFor: self announcing: 'Postscript'.
			self class currentChangeSet postscriptString: postscript contents.
		].

		preamble isNil & postscript isNil ifTrue: [
			(self confirm: 'No install/preamble or install/postscript member were found.
	Install all the members automatically?') ifTrue: [ self installAllMembers ]
		].

	] ensure: [ stream close ].

