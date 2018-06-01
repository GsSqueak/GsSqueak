testing preprocessor directives
testIfdefEndif
	"Test isDefined:inSmalltalk:comment:ifTrue: "

	"(SlangTest selector: #testIfdefEndif) run"

	| stssi cString stringWithoutWhiteSpace lines |
	self flag: #FIXME. "See redundant implementation in oscog #cppIf:ifTrue:"

	stssi := SlangTestSupportInterpreter inline: false.

	"verify that the default Smalltalk block that is evaluated in simulation"
	self assert: stssi ifdefEndif = #defaultBlockForSimulation.

	"verify generated C string"
	cString := stssi asCString: #ifdefEndif.
	lines := (cString findTokens: Character cr) select: [:e |
		{
			'# ifdef HAVE_FOO  // some platforms do not support foo properly' .
			'	return 1;' .
			'# endif  // HAVE_FOO'
		} includes: e ].
	self should: lines size = 3.

	"check the rest of the method, ignoring whitespace"
	cString := stssi asCString: #ifdefEndif.
	stringWithoutWhiteSpace := cString reject: [:e | e isSeparator].
	self should: stringWithoutWhiteSpace =
		'sqIntifdefEndif(void){#ifdefHAVE_FOO//someplatformsdonotsupportfooproperlyreturn1;#endif//HAVE_FOOreturn0;}'.

"
sqInt ifdefEndif(void) {
	
# ifdef HAVE_FOO  // some platforms do not support foo properly
	return 1;
# endif  // HAVE_FOO
	
	return 0;
}
"