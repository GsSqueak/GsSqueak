instance creation
fontOffsetsInFile: file
	"Answer a collection of font offsets in the given file"
	| tag version nFonts |
	file position: 0.
	tag := file next: 4.
	tag caseOf: {
		['true' asByteArray] -> ["Version 1.0 TTF file"
			"http://developer.apple.com/textfonts/TTRefMan/RM06/Chap6.html
			The values 'true' (0x74727565) and 0x00010000 are recognized by the Mac OS 
			as referring to TrueType fonts."
			^Array with: 0 "only one font"
		].
		[#[0 1 0 0]] -> ["Version 1.0 TTF file"
			^Array with: 0 "only one font"
		].
		['ttcf' asByteArray]	-> ["TTC file"
			version := file next: 4.
			(version = #[0 1 0 0] or: [version = #[0 2 0 0]]) ifFalse: [^self error: 'Unsupported TTC version'].
			nFonts := file nextNumber: 4.
			^(1 to: nFonts) collect: [:i | file nextNumber: 4].
		].
	} otherwise:[
		self error: 'This is not a valid Truetype file'.
	].