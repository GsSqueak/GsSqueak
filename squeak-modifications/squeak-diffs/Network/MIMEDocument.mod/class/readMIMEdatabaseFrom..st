initialize-release
readMIMEdatabaseFrom: someStream
	| d line tokens stream |
	"type/subtype    extension"
	"white spaces are separators"
	"apache conf file format: mime.types"

	"must normalize line endings"
	stream := ReadStream on: someStream contentsOfEntireFile withSqueakLineEndings.

	d := Dictionary new.
	[(line := stream nextLine) isNil not]
		whileTrue: [tokens := line findTokens: ' 	'.
			(tokens size = 2 and: [line first ~= $#])
				ifTrue: [d at: tokens second put: tokens first]].
	^d