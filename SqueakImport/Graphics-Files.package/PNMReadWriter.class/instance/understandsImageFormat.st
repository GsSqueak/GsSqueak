testing
understandsImageFormat
	"P1 to P7"
	| p  |
	p := stream next asCharacter.
	type := stream next - 48.
	^(p = $P and:[type > 0 and:[type < 8]])
	