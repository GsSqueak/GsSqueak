initialize-release
analyze: aString
	"Analyze the selected text to find both the parameter to store and the text to emphesize (may be different from original selection).  Does not return self!.  May be multiline or of the form:
3+4
<3+4>
Click Here<3+4>
<3+4>Click Here
"
	"Obtain the showing text and the instructions"
	| b1 b2 singleLine trim param show |
	b1 := aString indexOf: $<.
	b2 := aString indexOf: $>.
	singleLine := aString lineCount = 0.
	(singleLine or: [(b1 < b2) & (b1 > 0)]) ifFalse: ["only one part"
		param := self validate: aString.
		param ifNil: [ ^{ nil. nil } ].
		^ Array with: param with: (param size = 0 ifFalse: [param])].
	"Two parts"
	trim := aString withBlanksTrimmed.
	(trim at: 1) == $< 
		ifTrue: [(trim last) == $>
			ifTrue: ["only instructions" 
				param := self validate: (aString copyFrom: b1+1 to: b2-1).
				show := param size = 0 ifFalse: [param]]
			ifFalse: ["at the front"
				param := self validate: (aString copyFrom: b1+1 to: b2-1).
				show := param size = 0 ifFalse: [aString copyFrom: b2+1 to: aString size]]]
		ifFalse: [(trim last) == $>
			ifTrue: ["at the end"
				param := self validate: (aString copyFrom: b1+1 to: b2-1).
				show := param size = 0 ifFalse: [aString copyFrom: 1 to: b1-1]]
			ifFalse: ["Arbitrary string. Let the compiler handle the complete string"
				param := self validate: aString.
				param ifNil: [ ^{ nil. nil }].
				show := (param size = 0 ifFalse: [param])]].
	^ Array with: param with: show
