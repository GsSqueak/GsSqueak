instance creation
addClassicSyntaxHighlighting: theme
	"This was the former default highlighting. Just overwrite the different values."
		
	theme	
		set: #comment for: #SHTextStylerST80 to: {Color green muchDarker. TextEmphasis italic};
		set: #symbol for: #SHTextStylerST80 to: {Color blue muchDarker. TextEmphasis bold};	
		set: #stringSymbol for: #SHTextStylerST80 to: {Color blue muchDarker. TextEmphasis bold};	
		set: #literalArray for: #SHTextStylerST80 to: {Color blue muchDarker. TextEmphasis bold};

		set: #self for: #SHTextStylerST80 to: {Color red muchDarker. TextEmphasis bold};
		set: #super for: #SHTextStylerST80 to: {Color red muchDarker. TextEmphasis bold}; 
		set: #true for: #SHTextStylerST80 to: {Color red muchDarker. TextEmphasis bold};
		set: #false for: #SHTextStylerST80 to: {Color red muchDarker. TextEmphasis bold};
		set: #nil for: #SHTextStylerST80 to: {Color red muchDarker. TextEmphasis bold};

		set: #thisContext for: #SHTextStylerST80 to: {Color red muchDarker. TextEmphasis bold};
		set: #return for: #SHTextStylerST80 to: {Color red muchDarker. TextEmphasis bold};
		set: #patternArg for: #SHTextStylerST80 to: {Color blue muchDarker. TextEmphasis italic};	
		set: #methodArg for: #SHTextStylerST80 to: {Color blue muchDarker. TextEmphasis italic};
		set: #blockPatternArg for: #SHTextStylerST80 to: {Color blue muchDarker. TextEmphasis italic};
		set: #blockArg for: #SHTextStylerST80 to: {Color blue muchDarker. TextEmphasis italic};
		set: #argument for: #SHTextStylerST80 to: {Color blue muchDarker. TextEmphasis italic};

		set: #primitiveOrExternalCallStart for: #SHTextStylerST80 to: {Color black. TextEmphasis bold}; 
		set: #primitiveOrExternalCallEnd for: #SHTextStylerST80 to: {Color black. TextEmphasis bold};

		set: #blockTempVar for: #SHTextStylerST80 to: {Color gray. TextEmphasis italic};
		set: #blockPatternTempVar for: #SHTextStylerST80 to: {Color gray. TextEmphasis italic};
		set: #instVar for: #SHTextStylerST80 to: {Color black. TextEmphasis bold};
		set: #workspaceVar for: #SHTextStylerST80 to: {Color black. TextEmphasis bold};
		set: #undefinedIdentifier for: #SHTextStylerST80 to: {Color red. TextEmphasis bold};

		set: #tempVar for: #SHTextStylerST80 to: {Color gray darker. TextEmphasis italic};
		set: #patternTempVar for: #SHTextStylerST80 to: {Color gray darker. TextEmphasis italic};
		set: #poolConstant for: #SHTextStylerST80 to: {Color gray muchDarker. TextEmphasis italic};
		set: #classVar for: #SHTextStylerST80 to: {Color gray muchDarker. TextEmphasis bold};
		set: #globalVar for: #SHTextStylerST80 to: {Color black. TextEmphasis bold}.