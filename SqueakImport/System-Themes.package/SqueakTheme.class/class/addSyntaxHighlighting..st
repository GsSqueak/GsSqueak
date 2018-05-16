instance creation
addSyntaxHighlighting: theme
	"This was the former sub-dued highlighting.
	self create apply.
	"
	
	theme
		set: #color for: #TextAction to: Color aqua;
		
		set: #default for: #SHTextStylerST80 to: {Color black};
		set: #invalid for: #SHTextStylerST80 to: {Color red};
		set: #excessCode for: #SHTextStylerST80 to: {Color red};
		set: #comment for: #SHTextStylerST80 to: {Color cyan muchDarker};
		set: #unfinishedComment for: #SHTextStylerST80 to: {Color red muchDarker. TextEmphasis italic};
		set: #'$' for: #SHTextStylerST80 to: {Color red muchDarker};
		set: #character for: #SHTextStylerST80 to: {Color red muchDarker};
		set: #integer for: #SHTextStylerST80 to: {Color red muchDarker};
		set: #number for: #SHTextStylerST80 to: {Color red muchDarker};	
		set: #- for: #SHTextStylerST80 to: {Color red muchDarker};
		set: #symbol for: #SHTextStylerST80 to: {Color blue muchDarker};	
		set: #stringSymbol for: #SHTextStylerST80 to: {Color blue muchDarker};	
		set: #literalArray for: #SHTextStylerST80 to: {Color blue muchDarker};
		set: #string for: #SHTextStylerST80 to: {Color magenta muchDarker. TextEmphasis normal};
		set: #unfinishedString for: #SHTextStylerST80 to: {Color red. TextEmphasis normal};
		set: #assignment for: #SHTextStylerST80 to: {nil. TextEmphasis bold};
		set: #ansiAssignment for: #SHTextStylerST80 to: {nil. TextEmphasis bold};
		set: #literal for: #SHTextStylerST80 to: {nil. TextEmphasis italic};
		set: #keyword for: #SHTextStylerST80 to: {Color blue muchDarker};
		set: #binary for: #SHTextStylerST80 to: {Color blue muchDarker};	
		set: #unary for: #SHTextStylerST80 to: {Color blue muchDarker};
		set: #incompleteKeyword for: #SHTextStylerST80 to: {Color gray muchDarker. TextEmphasis underlined};
		set: #incompleteBinary for: #SHTextStylerST80 to: {Color gray muchDarker. TextEmphasis underlined};	
		set: #incompleteUnary for: #SHTextStylerST80 to: {Color gray muchDarker. TextEmphasis underlined};
		set: #undefinedKeyword for: #SHTextStylerST80 to: {Color red};
		set: #undefinedBinary for: #SHTextStylerST80 to: {Color red};	
		set: #undefinedUnary for: #SHTextStylerST80 to: {Color red};													
		set: #patternKeyword for: #SHTextStylerST80 to: {nil. TextEmphasis bold};
		set: #patternBinary for: #SHTextStylerST80 to: {nil. TextEmphasis bold};
		set: #patternUnary for: #SHTextStylerST80 to: {nil. TextEmphasis bold};	
		set: #self for: #SHTextStylerST80 to: {Color red muchDarker};
		set: #super for: #SHTextStylerST80 to: {Color red muchDarker}; 
		set: #true for: #SHTextStylerST80 to: {Color red muchDarker};
		set: #false for: #SHTextStylerST80 to: {Color red muchDarker};
		set: #nil for: #SHTextStylerST80 to: {Color red muchDarker};
		set: #thisContext for: #SHTextStylerST80 to: {Color red muchDarker};
		set: #return for: #SHTextStylerST80 to: {Color red muchDarker};
		set: #patternArg for: #SHTextStylerST80 to: {Color blue muchDarker};	
		set: #methodArg for: #SHTextStylerST80 to: {Color blue muchDarker};
		set: #blockPatternArg for: #SHTextStylerST80 to: {Color blue muchDarker};
		set: #blockArg for: #SHTextStylerST80 to: {Color blue muchDarker};
		set: #argument for: #SHTextStylerST80 to: {Color blue muchDarker};
		set: #blockArgColon for: #SHTextStylerST80 to: {Color black}; 
		set: #leftParenthesis for: #SHTextStylerST80 to: {Color black}; 
		set: #rightParenthesis for: #SHTextStylerST80 to: {Color black}; 
		set: #leftParenthesis1 for: #SHTextStylerST80 to: {Color green muchDarker}; 
		set: #rightParenthesis1 for: #SHTextStylerST80 to: {Color green muchDarker}; 
		set: #leftParenthesis2 for: #SHTextStylerST80 to: {Color magenta muchDarker}; 
		set: #rightParenthesis2 for: #SHTextStylerST80 to: {Color magenta muchDarker}; 
		set: #leftParenthesis3 for: #SHTextStylerST80 to: {Color red muchDarker}; 
		set: #rightParenthesis3 for: #SHTextStylerST80 to: {Color red muchDarker}; 
		set: #leftParenthesis4 for: #SHTextStylerST80 to: {Color green darker}; 
		set: #rightParenthesis4 for: #SHTextStylerST80 to: {Color green darker}; 
		set: #leftParenthesis5 for: #SHTextStylerST80 to: {Color orange darker}; 
		set: #rightParenthesis5 for: #SHTextStylerST80 to: {Color orange darker}; 
		set: #leftParenthesis6 for: #SHTextStylerST80 to: {Color magenta darker}; 
		set: #rightParenthesis6 for: #SHTextStylerST80 to: {Color magenta darker}; 
		set: #leftParenthesis7 for: #SHTextStylerST80 to: {Color blue}; 
		set: #rightParenthesis7 for: #SHTextStylerST80 to: {Color blue}; 
		set: #blockStart for: #SHTextStylerST80 to: {Color black}; 
		set: #blockEnd for: #SHTextStylerST80 to: {Color black}; 
		set: #blockStart1 for: #SHTextStylerST80 to: {Color green muchDarker}; 
		set: #blockEnd1 for: #SHTextStylerST80 to: {Color green muchDarker}; 
		set: #blockStart2 for: #SHTextStylerST80 to: {Color magenta muchDarker}; 
		set: #blockEnd2 for: #SHTextStylerST80 to: {Color magenta muchDarker}; 
		set: #blockStart3 for: #SHTextStylerST80 to: {Color red muchDarker}; 
		set: #blockEnd3 for: #SHTextStylerST80 to: {Color red muchDarker}; 
		set: #blockStart4 for: #SHTextStylerST80 to: {Color green darker}; 
		set: #blockEnd4 for: #SHTextStylerST80 to: {Color green darker}; 
		set: #blockStart5 for: #SHTextStylerST80 to: {Color orange darker}; 
		set: #blockEnd5 for: #SHTextStylerST80 to: {Color orange darker}; 
		set: #blockStart6 for: #SHTextStylerST80 to: {Color magenta darker}; 
		set: #blockEnd6 for: #SHTextStylerST80 to: {Color magenta darker}; 
		set: #blockStart7 for: #SHTextStylerST80 to: {Color blue}; 
		set: #blockEnd7 for: #SHTextStylerST80 to: {Color blue}; 																																																		
		set: #arrayStart for: #SHTextStylerST80 to: {Color black}; 
		set: #arrayEnd for: #SHTextStylerST80 to: {Color black}; 
		set: #arrayStart1 for: #SHTextStylerST80 to: {Color black}; 
		set: #arrayEnd1 for: #SHTextStylerST80 to: {Color black}; 
		set: #byteArrayStart for: #SHTextStylerST80 to: {Color black}; 
		set: #byteArrayEnd for: #SHTextStylerST80 to: {Color black}; 
		set: #byteArrayStart1 for: #SHTextStylerST80 to: {Color black}; 
		set: #byteArrayEnd1 for: #SHTextStylerST80 to: {Color black}; 
		set: #leftBrace for: #SHTextStylerST80 to: {Color black}; 
		set: #rightBrace for: #SHTextStylerST80 to: {Color black}; 
		set: #cascadeSeparator for: #SHTextStylerST80 to: {Color black}; 
		set: #statementSeparator for: #SHTextStylerST80 to: {Color black}; 
		set: #externalCallType for: #SHTextStylerST80 to: {Color black}; 
		set: #externalCallTypePointerIndicator for: #SHTextStylerST80 to: {Color black}; 
		set: #primitiveOrExternalCallStart for: #SHTextStylerST80 to: {Color black}; 
		set: #primitiveOrExternalCallEnd for: #SHTextStylerST80 to: {Color black};
		set: #methodTempBar for: #SHTextStylerST80 to: {Color gray}; 
		set: #blockTempBar for: #SHTextStylerST80 to: {Color gray};
		set: #blockArgsBar for: #SHTextStylerST80 to: {Color gray};
		set: #primitive for: #SHTextStylerST80 to: {Color green muchDarker. TextEmphasis bold};
		set: #pragmaKeyword for: #SHTextStylerST80 to: {Color green muchDarker. TextEmphasis bold};
		set: #pragmaUnary for: #SHTextStylerST80 to: {Color green muchDarker. TextEmphasis bold};
		set: #pragmaBinary for: #SHTextStylerST80 to: {Color green muchDarker. TextEmphasis bold};									
		set: #externalFunctionCallingConvention for: #SHTextStylerST80 to: {Color green muchDarker. TextEmphasis bold}; 
		set: #module for: #SHTextStylerST80 to: {Color green muchDarker. TextEmphasis bold};
		set: #blockTempVar for: #SHTextStylerST80 to: {Color gray};
		set: #blockPatternTempVar for: #SHTextStylerST80 to: {Color gray};
		set: #instVar for: #SHTextStylerST80 to: {Color black};
		set: #workspaceVar for: #SHTextStylerST80 to: {Color black};
		set: #undefinedIdentifier for: #SHTextStylerST80 to: {Color red};
		set: #incompleteIdentifier for: #SHTextStylerST80 to: {Color gray darker. {TextEmphasis italic. TextEmphasis underlined}};
		set: #tempVar for: #SHTextStylerST80 to: {Color gray darker};
		set: #patternTempVar for: #SHTextStylerST80 to: {Color gray darker};
		set: #poolConstant for: #SHTextStylerST80 to: {Color gray muchDarker};
		set: #classVar for: #SHTextStylerST80 to: {Color gray muchDarker};
		set: #globalVar for: #SHTextStylerST80 to: {Color black}.
		
	"And the text differ"
	theme	
		set: #insertTextAttributes for: #TextDiffBuilder to: { TextColor red };
		set: #removeTextAttributes for: #TextDiffBuilder to: { TextEmphasis struckOut. TextColor blue };
		set: #normalTextAttributes for: #TextDiffBuilder to: { TextEmphasis normal }.