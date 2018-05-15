class initialization
initTextConstants 
	"Initialize constants shared by classes associated with text display, e.g., 
	Space, Tab, Cr, Bs, ESC."
		"1/24/96 sw: in exasperation and confusion, changed cmd-g mapping from 231 to 232 to see if I could gain any relief?!"


	| letter varAndValue |
	"CtrlA..CtrlZ, Ctrla..Ctrlz"
	letter := $A.
 	#(		212 230 228 196 194 226 241 243 214 229 200 217 246 
			245 216 202 210 239 211 240 197 198 209 215 242 231
	 		1 166 228 132 130 12 232 179 150 165 136 153 182 
			14 15 138 17 18 19 11 21 134 145 151 178 167 ) do:
		[:kbd |
		TextConstants at: ('Ctrl', letter asSymbol) asSymbol put: kbd asCharacter.
		letter := letter == $Z ifTrue: [$a] ifFalse: [(letter asciiValue + 1) asCharacter]].

	varAndValue := #(
		Space	32
		Tab		9
		CR		13
		Enter	3
		BS		8
		BS2		158
		ESC		160
		Clear 	173
	).

	varAndValue size odd ifTrue: [self error: 'unpaired text constant'].
	(2 to: varAndValue size by: 2) do:
		[:i | TextConstants at: (varAndValue at: i - 1) put: (varAndValue at: i) asCharacter].

	varAndValue := #(
		CtrlDigits 			(159 144 143 128 127 129 131 180 149 135)
		CtrlOpenBrackets	(201 7 218 249 219 15)
			"lparen gottn by ctrl-:= = 201; should be 213 but can't type that on Mac"

			"values for alignment"
		LeftFlush	0
		RightFlush	1
		Centered	2
		Justified	3

			"subscripts for a marginTabsArray tuple"
		LeftMarginTab	1
		RightMarginTab	2

			"font faces"
		Basal	0
		Bold	1
		Italic	2

			"in case font doesn't have a width for space character"
			"some plausible numbers-- are they the right ones?"
		DefaultSpace			4
		DefaultTab				24
		DefaultLineGrid			16
		DefaultBaseline			12
		DefaultFontFamilySize	3	"basal, bold, italic"
	).

	varAndValue size odd ifTrue: [self error: 'unpaired text constant'].
	(2 to: varAndValue size by: 2) do:
		[:i | TextConstants at: (varAndValue at: i - 1) put: (varAndValue at: i)].


"Text initTextConstants "
