file list menu
servicesFileContentsMenu: aMenu 
	"Construct aMenu to have items appropriate for the file browser's code
	pane, for the unshifted state"
	<fileContentsMenuShifted: false>
	fileName
		ifNotNil: [| services maybeLine extraLines |
			services := OrderedCollection new.
			(#(#briefHex #briefFile #needToGetBriefHex #needToGetBrief ) includes: brevityState)
				ifTrue: [services add: self serviceGet].
			(#(#fullHex #briefHex #needToGetFullHex #needToGetBriefHex ) includes: brevityState)
				ifFalse: [services add: self serviceGetHex].
			(#(#needToGetShiftJIS #needToGetEUCJP #needToGetCNGB #needToGetEUCKR #needToGetUTF8 ) includes: brevityState)
				ifFalse: [services add: self serviceGetEncodedText].
			maybeLine := services size.
			(FileStream sourceFileSuffixes includes: self suffixOfSelectedFile)
				ifTrue: [services
						addAll: (self servicesFromSelectorSpecs: #(#fileIntoNewChangeSet: #fileIn: #browseChangesFile: #browseFile: ))].
			extraLines := OrderedCollection new.
			maybeLine > 0
				ifTrue: [extraLines add: maybeLine].
			services size > maybeLine
				ifTrue: [extraLines add: services size].
			aMenu
				addServices: services
				for: self
				extraLines: extraLines].
	^ aMenu