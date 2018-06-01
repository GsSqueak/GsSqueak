testing preprocessor directives
testIfElseEndif
	"Test isDefinedTrueExpression:inSmalltalk:comment:ifTrue:ifFalse: "

	"(SlangTest selector: #testIfElseEndif) run"

	| stssi cString stringWithoutWhiteSpace lines |
	stssi := SlangTestSupportInterpreter inline: false.

	"verify that the default Smalltalk block that is evaluated in simulation"
	self assert: stssi ifDefinedTrueElseEndif = 4.

	"verify generated C string"
	cString := stssi asCString: #ifDefinedTrueElseEndif.
	lines := (cString findTokens: Character cr) select: [:e |
		{
			'# if (SIZE == 8)  // SIZE may be 4 or 8' .
			'	return 8;' .
			'# else' .
			'	return 4;' .
			'# endif  // SIZE == 8'
		} includes: e ].
	self should: lines size = 5.
	self should: ('*return 8*' match: lines second).
	self should: ('*return 4*' match: lines fourth).

	"check the rest of the method, ignoring whitespace"
	cString := stssi asCString: #ifDefinedTrueElseEndif.
	stringWithoutWhiteSpace := cString reject: [:e | e isSeparator].
	self should: stringWithoutWhiteSpace =
		'sqIntifDefinedTrueElseEndif(void){#if(SIZE==8)//SIZEmaybe4or8return8;#elsereturn4;#endif//SIZE==8returnnull;}'.

"
sqInt ifDefinedTrueElseEndif(void) {
	
# if (SIZE == 8)  // SIZE may be 4 or 8
	return 8;
# else
	return 4;
# endif  // SIZE == 8
	
	return null;
}
"