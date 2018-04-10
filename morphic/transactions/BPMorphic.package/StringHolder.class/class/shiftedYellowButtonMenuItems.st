-Tools-yellow button menu
shiftedYellowButtonMenuItems
	"Returns the standard yellow button menu items"
	| _gsSqueakTemp_entries |
	_gsSqueakTemp_entries := OrderedCollection withAll: {#-. {'explain' translated. #explain}. {'pretty print' translated. #prettyPrint}. {'pretty print with color' translated. #prettyPrintWithColor}. {'file it in (G)' translated. #fileItIn}. {'spawn (o)' translated. #spawn}. #-. {'browse it (b)' translated. #browseIt}. {'senders of it (n)' translated. #sendersOfIt}. {'implementors of it (m)' translated. #implementorsOfIt}. {'references to it (N)' translated. #referencesToIt}. #-. {'selectors containing it (W)' translated. #methodNamesContainingIt}. {'method strings with it (E)' translated. #methodStringsContainingit}. {'method source with it' translated. #methodSourceContainingIt}. {'class names containing it' translated. #classNamesContainingIt}. {'class comments with it' translated. #classCommentsContainingIt}. {'change sets with it' translated. #browseChangeSetsWithSelector}. #-. {'save contents to file...' translated. #saveContentsInFile}. {'send contents to printer' translated. #sendContentsToPrinter}. {'printer setup' translated. #printerSetup}. #-}.
	Smalltalk isMorphic
		ifFalse: [_gsSqueakTemp_entries add: {'special menu...' translated. #presentSpecialMenu}].
	_gsSqueakTemp_entries add: {'more...' translated. #yellowButtonActivity}.
	^ _gsSqueakTemp_entries