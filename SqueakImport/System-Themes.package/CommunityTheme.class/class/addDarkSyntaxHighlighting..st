instance creation
addDarkSyntaxHighlighting: aUserInterfaceTheme
	"self createDark apply."
	| normal bold italic underlined darkMap | normal  := TextEmphasis normal.  bold:=TextEmphasis bold.  italic:=TextEmphasis italic.  underlined := TextEmphasis underlined.  darkMap := StrikeFont familyName: 'Darkmap DejaVu Sans' pointSize: 9.
	aUserInterfaceTheme
		set: #color for: #TextAction to: self dbBlue;
	
		set: #default for: #SHTextStylerST80 to: {self dbForeground};
		set: #invalid for: #SHTextStylerST80 to: {self dbInvalid};
		set: #excessCode for: #SHTextStylerST80 to: {self dbInvalid twiceDarker};
		"Descriptive text for humans, italicized."
		set: #comment for: #SHTextStylerST80 to: {self dbComment. italic};
		set: #unfinishedComment for: #SHTextStylerST80 to: {self dbComment darker. italic};
		set: #'$' for: #SHTextStylerST80 to: {self dbConstant};
		set: #character for: #SHTextStylerST80 to: {self dbConstant};
		set: #integer for: #SHTextStylerST80 to: {self dbConstant};
		set: #number for: #SHTextStylerST80 to: {self dbConstant};
		set: #- for: #SHTextStylerST80 to: {self dbForeground. bold};
		set: #= for: #SHTextStylerST80 to: {self dbForeground. bold};
		set: #symbol for: #SHTextStylerST80 to: {self dbBedrock};
		set: #stringSymbol for: #SHTextStylerST80 to: {self dbBedrock};
		set: #literalArray for: #SHTextStylerST80 to: {self dbForeground};
		set: #string for: #SHTextStylerST80 to: {self dbConstant};
		set: #unfinishedString for: #SHTextStylerST80 to: {self dbConstant darker};
		set: #assignment for: #SHTextStylerST80 to: {nil. bold};
		set: #ansiAssignment for: #SHTextStylerST80 to: {nil. bold};
		set: #literal for: #SHTextStylerST80 to: {nil. bold};
		set: #keyword for: #SHTextStylerST80 to: {self dbMessage};
		set: #binary for: #SHTextStylerST80 to: {self dbForeground. bold};
		set: #unary for: #SHTextStylerST80 to: {self dbMessage};
		set: #incompleteKeyword for: #SHTextStylerST80 to: {self dbMessage darker. {underlined. bold}};
		set: #incompleteBinary for: #SHTextStylerST80 to: {self dbMessage darker. underlined};
		set: #incompleteUnary for: #SHTextStylerST80 to: {self dbMessage darker. underlined};
		set: #undefinedKeyword for: #SHTextStylerST80 to: {self dbInvalid};
		set: #undefinedBinary for: #SHTextStylerST80 to: {self dbInvalid};
		set: #undefinedUnary for: #SHTextStylerST80 to: {self dbInvalid};
		"Delineate the selector (good for new users), and make the method look like a mini-document with a title."
		set: #patternKeyword for: #SHTextStylerST80 to: {self dbMessage lighter.  {bold. underlined}};
		set: #patternBinary for: #SHTextStylerST80 to: {nil. bold};
		set: #patternUnary for: #SHTextStylerST80 to: {self dbMessage lighter.  {bold. underlined}};	
		set: #self for: #SHTextStylerST80 to: {self dbBedrock. bold};
		set: #super for: #SHTextStylerST80 to: {self dbBedrock. bold}; 
		set: #true for: #SHTextStylerST80 to: {self dbBedrock. bold};
		set: #false for: #SHTextStylerST80 to: {self dbBedrock. bold};
		set: #nil for: #SHTextStylerST80 to: {self dbBedrock. bold};
		set: #thisContext for: #SHTextStylerST80 to: {self dbBedrock. bold};
		set: #return for: #SHTextStylerST80 to: {self dbForeground. bold};
		set: #patternArg for: #SHTextStylerST80 to: {self dbSelection twiceLighter. TextEmphasis normal. "darkMap"};	
		set: #methodArg for: #SHTextStylerST80 to: {self dbSelection twiceLighter. TextEmphasis normal. "darkMap"};
		set: #blockPatternArg for: #SHTextStylerST80 to: {self dbSelection twiceLighter};
		set: #blockArg for: #SHTextStylerST80 to: {self dbSelection twiceLighter};
		set: #argument for: #SHTextStylerST80 to: {self dbSelection twiceLighter};
		set: #blockArgColon for: #SHTextStylerST80 to: {self dbBedrock}; 
		set: #leftParenthesis for: #SHTextStylerST80 to: {self dbBedrock muchLighter}; 
		set: #rightParenthesis for: #SHTextStylerST80 to: {self dbBedrock muchLighter}; 
		set: #leftParenthesis1 for: #SHTextStylerST80 to: {self dbBedrock twiceLighter}; 
		set: #rightParenthesis1 for: #SHTextStylerST80 to: {self dbBedrock twiceLighter}; 
		set: #leftParenthesis2 for: #SHTextStylerST80 to: {self dbBedrock}; 
		set: #rightParenthesis2 for: #SHTextStylerST80 to: {self dbBedrock}; 
		set: #leftParenthesis3 for: #SHTextStylerST80 to: {self dbPurple muchLighter}; 
		set: #rightParenthesis3 for: #SHTextStylerST80 to: {self dbPurple muchLighter}; 
		set: #leftParenthesis4 for: #SHTextStylerST80 to: {self dbPurple muchLighter}; 
		set: #rightParenthesis4 for: #SHTextStylerST80 to: {self dbPurple muchLighter}; 
		set: #leftParenthesis5 for: #SHTextStylerST80 to: {self dbOrange muchLighter}; 
		set: #rightParenthesis5 for: #SHTextStylerST80 to: {self dbOrange muchLighter}; 
		set: #leftParenthesis6 for: #SHTextStylerST80 to: {self dbOrange muchLighter}; 
		set: #rightParenthesis6 for: #SHTextStylerST80 to: {self dbOrange muchLighter}; 
		set: #leftParenthesis7 for: #SHTextStylerST80 to: {Color yellow}; 
		set: #rightParenthesis7 for: #SHTextStylerST80 to: {Color yellow}; 
		set: #blockStart for: #SHTextStylerST80 to: {self dbBedrock muchLighter}; 
		set: #blockEnd for: #SHTextStylerST80 to: {self dbBedrock muchLighter}; 
		set: #blockStart1 for: #SHTextStylerST80 to: {self dbBedrock twiceLighter}; 
		set: #blockEnd1 for: #SHTextStylerST80 to: {self dbBedrock twiceLighter}; 
		set: #blockStart2 for: #SHTextStylerST80 to: {self dbBedrock}; 
		set: #blockEnd2 for: #SHTextStylerST80 to: {self dbBedrock}; 
		set: #blockStart3 for: #SHTextStylerST80 to: {self dbPurple muchLighter}; 
		set: #blockEnd3 for: #SHTextStylerST80 to: {self dbPurple muchLighter}; 
		set: #blockStart4 for: #SHTextStylerST80 to: {self dbPurple muchLighter}; 
		set: #blockEnd4 for: #SHTextStylerST80 to: {self dbPurple muchLighter}; 
		set: #blockStart5 for: #SHTextStylerST80 to: {self dbOrange muchLighter}; 
		set: #blockEnd5 for: #SHTextStylerST80 to: {self dbOrange muchLighter}; 
		set: #blockStart6 for: #SHTextStylerST80 to: {self dbOrange muchLighter}; 
		set: #blockEnd6 for: #SHTextStylerST80 to: {self dbOrange muchLighter}; 
		set: #blockStart7 for: #SHTextStylerST80 to: {Color yellow}; 
		set: #blockEnd7 for: #SHTextStylerST80 to: {Color yellow}; 																																					
		set: #arrayStart for: #SHTextStylerST80 to: {self dbBedrock}; 
		set: #arrayEnd for: #SHTextStylerST80 to: {self dbBedrock}; 
		set: #arrayStart1 for: #SHTextStylerST80 to: {self dbForeground}; 
		set: #arrayEnd1 for: #SHTextStylerST80 to: {self dbForeground}; 
		set: #byteArrayStart for: #SHTextStylerST80 to: {self dbForeground}; 
		set: #byteArrayEnd for: #SHTextStylerST80 to: {self dbForeground}; 
		set: #byteArrayStart1 for: #SHTextStylerST80 to: {self dbForeground}; 
		set: #byteArrayEnd1 for: #SHTextStylerST80 to: {self dbForeground}; 
		set: #leftBrace for: #SHTextStylerST80 to: {self dbForeground}; 
		set: #rightBrace for: #SHTextStylerST80 to: {self dbForeground}; 
		set: #cascadeSeparator for: #SHTextStylerST80 to: {self dbForeground}; 
		set: #statementSeparator for: #SHTextStylerST80 to: {self dbForeground}; 
		set: #externalCallType for: #SHTextStylerST80 to: {self dbForeground}; 
		set: #externalCallTypePointerIndicator for: #SHTextStylerST80 to: {self dbForeground}; 
		set: #primitiveOrExternalCallStart for: #SHTextStylerST80 to: {self dbForeground}; 
		set: #primitiveOrExternalCallEnd for: #SHTextStylerST80 to: {self dbForeground};
		set: #methodTempBar for: #SHTextStylerST80 to: {self dbBedrock};
		set: #blockTempBar for: #SHTextStylerST80 to: {self dbBedrock};
		set: #blockArgsBar for: #SHTextStylerST80 to: {self dbBedrock};
		set: #primitive for: #SHTextStylerST80 to: {self dbGreen lighter. bold};
		set: #pragmaKeyword for: #SHTextStylerST80 to: {self dbGreen. bold};
		set: #pragmaUnary for: #SHTextStylerST80 to: {self dbGreen. bold};
		set: #pragmaBinary for: #SHTextStylerST80 to: {self dbGreen. bold};									
		set: #externalFunctionCallingConvention for: #SHTextStylerST80 to: {self dbGreen. bold}; 
		set: #module for: #SHTextStylerST80 to: {self dbGreen. bold};
		set: #blockTempVar for: #SHTextStylerST80 to: {self dbLocal. italic};
		set: #blockPatternTempVar for: #SHTextStylerST80 to: {self dbLocal. italic};
		set: #instVar for: #SHTextStylerST80 to: {self dbYellow. normal };
		set: #workspaceVar for: #SHTextStylerST80 to: {self dbLocal. italic};
		set: #undefinedIdentifier for: #SHTextStylerST80 to: {self dbInvalid};
		set: #incompleteIdentifier for: #SHTextStylerST80 to: {self dbGray. underlined};
		set: #tempVar for: #SHTextStylerST80 to: {self dbLocal. italic};
		set: #patternTempVar for: #SHTextStylerST80 to: {self dbLocal. italic};
		set: #poolConstant for: #SHTextStylerST80 to: {self dbConstant };
		set: #classVar for: #SHTextStylerST80 to: {self dbReference};
		set: #globalVar for: #SHTextStylerST80 to: {self dbClass. normal}.
	"And the text differ"
	aUserInterfaceTheme	
		set: #insertTextAttributes for: #TextDiffBuilder to: { TextColor color: self dbRed };
		set: #removeTextAttributes for: #TextDiffBuilder to: { TextEmphasis struckOut. TextColor color: self dbBlue };
		set: #normalTextAttributes for: #TextDiffBuilder to: { TextEmphasis normal }.