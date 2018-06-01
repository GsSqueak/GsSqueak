ttf tables
processNamingTable: fontFile
"copyright         CHARPTR     The font's copyright notice.
familyName        CHARPTR     The font's family name.
subfamilyName     CHARPTR     The font's subfamily name.
uniqueName        CHARPTR     A unique identifier for this font.
fullName          CHARPTR     The font's full name (a combination of
                                          familyName and subfamilyName).
versionName       CHARPTR     The font's version string.
"
	| nRecords initialOffset storageOffset format |
	initialOffset := fontFile position.
	format := fontFile nextNumber: 2.
	format = 0 ifFalse: [self error: 'Cannot handle format 1 naming tables'].
	"Get the number of name records"
	nRecords := fontFile nextNumber: 2.
	"Offset from the beginning of this table"
	storageOffset := (fontFile nextNumber: 2) + initialOffset.
	1 to: nRecords do:[:i| |  pID sID lID nID length offset string |
		fontFile position: initialOffset + 6 + ((i-1) * 12).
		pID := fontFile nextNumber: 2.
		sID := fontFile nextNumber: 2.
		lID := fontFile nextNumber: 2.
		nID := fontFile nextNumber: 2.
		length := fontFile nextNumber: 2.
		offset := fontFile nextNumber: 2.
		"Read only Macintosh or Microsoft strings"
		(pID = 1 or:[pID = 3 and:[sID = 1]]) ifTrue:[
			"MS uses Unicode all others single byte"
			"multiBytes := pID = 3."
			fontFile position: storageOffset+offset.
			string := (fontFile next: length) asString.
			pID = 3 ifTrue:[ | keep |
				keep := true.
				string := string select:[:ch| keep := keep not].
			].
			"Select only English names, prefer Macintosh"
			((pID = 1 and: [lID = 0]) or: [pID = 3 and: [lID = 16r0409]]) ifTrue: [
				nID caseOf: {
					[0] -> [(pID = 1 or:[copyright == nil]) ifTrue:[copyright := string]].
					[1] -> [(pID = 1 or:[familyName == nil]) ifTrue:[familyName := string]].
					[2] -> [(pID = 1 or:[subfamilyName == nil]) ifTrue:[subfamilyName := string]].
					"[3] -> [(pID = 1 or:[uniqueName == nil]) ifTrue:[uniqueName := string]]."
					"[4] -> [(pID = 1 or:[fullName == nil]) ifTrue:[fullName := string]]."
					"[5] -> [(pID = 1 or:[versionName == nil]) ifTrue:[versionName := string]]."
					"[6] -> [(pID = 1 or:[postscriptName == ni]) ifTrue:[postscriptName := string]]."
					"[7] -> [(pID = 1 or:[trademark == nil]) ifTrue:[trademark := string]]."
				} otherwise:["ignore"].
			]
		].
	].
