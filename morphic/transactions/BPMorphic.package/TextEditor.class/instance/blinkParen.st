parenblinking
blinkParen
	"Used if Shout"
	lastParenLocation
		ifNotNil: [self text string size >= lastParenLocation
				ifTrue: [self text
						addAttribute: TextEmphasis bold
						from: lastParenLocation
						to: lastParenLocation]]