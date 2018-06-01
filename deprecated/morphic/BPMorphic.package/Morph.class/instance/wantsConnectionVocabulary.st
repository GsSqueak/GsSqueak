-Etoys-scripting
wantsConnectionVocabulary
	submorphs
		ifNil: [^ true].
	"called from EToyVocabulary>>initialize after basicNew"
	^ (Preferences valueOfFlag: #alwaysShowConnectionVocabulary)
		or: [(self respondsTo: #connections)
				and: [(self perform: #connections) isEmpty not]]