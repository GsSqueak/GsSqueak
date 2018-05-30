*Morphic-MorphicExtras-parts bin
supplementaryPartsDescriptions
	"Answer a list of DescriptionForPartsBin objects that characterize objects that this class wishes to contribute to Stationery bins *other* than by the standard default #newStandAlone protocol"

	^ {	DescriptionForPartsBin
			formalName: 'Status' translatedNoop
			categoryList: #()
			documentation: 'Buttons to run, stop, or single-step scripts' translatedNoop
			globalReceiverSymbol: #ScriptingSystem
			nativitySelector: #scriptControlButtons.
		DescriptionForPartsBin
			formalName: 'Scripting' translatedNoop
			categoryList: {'Scripting' translatedNoop}
			documentation: 'A confined place for drawing and scripting, with its own private stop/step/go buttons.' translatedNoop
			globalReceiverSymbol: #ScriptingSystem
			nativitySelector: #newScriptingSpace.
		DescriptionForPartsBin
			formalName: 'Random' translatedNoop
			categoryList: {'Scripting' translatedNoop}
			documentation: 'A tile that will produce a random number in a given range' translatedNoop
			globalReceiverSymbol: #FunctionTile
			nativitySelector: #randomNumberTile.
		DescriptionForPartsBin
			formalName: 'ButtonDown?' translatedNoop
			categoryList: {'Scripting' translatedNoop}
			documentation: 'Tiles for querying whether the mouse button is down' translatedNoop
			globalReceiverSymbol: #ScriptingSystem
			nativitySelector: #anyButtonPressedTiles.
		DescriptionForPartsBin
			formalName: 'ButtonUp?' translatedNoop
			categoryList: {'Scripting' translatedNoop}
			documentation: 'Tiles for querying whether the mouse button is up' translatedNoop
			globalReceiverSymbol: #ScriptingSystem
			nativitySelector: #noButtonPressedTiles.
		DescriptionForPartsBin
			formalName: 'NextPage' translatedNoop
			categoryList: {'Multimedia' translatedNoop}
			documentation: 'A button which, when clicked, takes the reader to the next page of a book' translatedNoop
			globalReceiverSymbol: #BookMorph
			nativitySelector: #nextPageButton.
		DescriptionForPartsBin
			formalName: 'PreviousPage' translatedNoop
			categoryList: {'Multimedia'}
			documentation: 'A button which, when clicked, takes the reader to the previous page of a book' translatedNoop
			globalReceiverSymbol: #BookMorph
			nativitySelector: #previousPageButton.},

	self partsDescriptionsFromToolsFlap