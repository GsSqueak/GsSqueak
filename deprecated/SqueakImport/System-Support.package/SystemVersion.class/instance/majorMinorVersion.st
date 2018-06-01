accessing
majorMinorVersion
	"Return the major/minor version number of the form X.Y, without any 'alpha' or 'beta' or other suffix."
	
	| char stream |
	^ (version includes: $.)
		ifTrue:
			[stream := ReadStream on: version, 'x'.
			stream upTo: $..
			char := stream next.
			[char isDigit]
				whileTrue: [char := stream next].
			version copyFrom: 1 to: stream position - 1]
		ifFalse:
			[version]

"
(SystemVersion new version: 'Squeak3.7alpha') majorMinorVersion
(SystemVersion new version: 'Testing') majorMinorVersion
SystemVersion current majorMinorVersion
"

