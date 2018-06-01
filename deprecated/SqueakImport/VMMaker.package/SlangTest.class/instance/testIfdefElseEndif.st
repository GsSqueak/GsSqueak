testing preprocessor directives
testIfdefElseEndif
	"Test isDefined:inSmalltalk:comment:ifTrue:ifFalse: "

	"(SlangTest selector: #testIfdefElseEndif) run"

	| stssi cString stringWithoutWhiteSpace lines |
	self flag: #FIXME. "See redundant implementation in oscog #cppIf:ifTrue:ifFalse:"

	stssi := SlangTestSupportInterpreter inline: false.

	"verify that the default Smalltalk block that is evaluated in simulation"
	self assert: stssi ifdefElseEndif = #defaultBlockForSimulation.

	"verify generated C string"
	cString := stssi asCString: #ifdefElseEndif.
	lines := (cString findTokens: Character cr) select: [:e |
		{
			'# ifdef HAVE_FOO  // some platforms do not support foo properly' .
			'	return 1;' .
			'# else' .
			'	return 0;' .
			'# endif  // HAVE_FOO'
		} includes: e ].
	self should: lines size = 5.
	self should: ('*return 1*' match: lines second).
	self should: ('*return 0*' match: lines fourth).

	"check the rest of the method, ignoring whitespace"
	stringWithoutWhiteSpace := cString reject: [:e | e isSeparator].
	self should: stringWithoutWhiteSpace =
		'sqIntifdefElseEndif(void){#ifdefHAVE_FOO//someplatformsdonotsupportfooproperlyreturn1;#elsereturn0;#endif//HAVE_FOOreturnnull;}'.

"
sqInt ifdefElseEndif(void) {
	
# ifdef HAVE_FOO  // some platforms do not support foo properly
	return 1;
# else
	return 0;
# endif  // HAVE_FOO
	
	return null;
}
"