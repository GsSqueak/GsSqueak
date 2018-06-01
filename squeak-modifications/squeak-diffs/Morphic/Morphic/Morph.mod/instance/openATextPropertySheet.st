meta-actions
openATextPropertySheet

	"should only be sent to morphs that are actually supportive"

	Smalltalk at: #TextPropertiesMorph ifPresent:[:aClass|
		^aClass basicNew
			targetMorph: self;
			initialize;
			openNearTarget
	].
	Beeper beep.