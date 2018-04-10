private
fileNameFromFormattedItem: item 
	"Extract fileName and folderString from a formatted fileList item string"
	| _gsSqueakTemp_from _gsSqueakTemp_to |
	self sortingByName
		ifTrue: [_gsSqueakTemp_from := item lastIndexOf: $(.
			_gsSqueakTemp_to := item lastIndexOf: $)]
		ifFalse: [_gsSqueakTemp_from := item indexOf: $(.
			_gsSqueakTemp_to := item indexOf: $)].
	^ (_gsSqueakTemp_from * _gsSqueakTemp_to = 0
		ifTrue: [item]
		ifFalse: [item
				copyReplaceFrom: _gsSqueakTemp_from
				to: _gsSqueakTemp_to
				with: '']) withBlanksTrimmed