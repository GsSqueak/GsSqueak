helper
textForFamily: familyName subfamily: subfamilyName 
	subfamilyName
		ifNil: [^ (TextStyle named: familyName)
				ifNil: [familyName]
				ifNotNil: [:style | style isTTCStyle
						ifTrue: ["we are already present"
							Text string: familyName attribute: TextEmphasis underlined]
						ifFalse: [familyName]]].
	"frome here on it is only about subfamilies"
	(self isStyleNameSupported: subfamilyName)
		ifFalse: [^ Text string: subfamilyName attribute: TextColor gray].
	^ (TextStyle named: familyName)
		ifNil: ["importable"
			subfamilyName]
		ifNotNil: [:style | (style isTTCStyle
					and: [| regular emph |
						regular := style fonts anyOne.
						emph := TTCFont indexOfSubfamilyName: subfamilyName.
						"detect if this style is already imported"
						regular emphasis = emph
							or: [(regular emphasis: emph)
									~= regular]])
				ifTrue: [Text string: subfamilyName attribute: TextEmphasis underlined]
				ifFalse: ["again importable"
					subfamilyName]]