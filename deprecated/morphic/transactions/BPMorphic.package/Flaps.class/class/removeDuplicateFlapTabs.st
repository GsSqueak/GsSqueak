shared flaps
removeDuplicateFlapTabs
	"Remove flaps that were accidentally added multiple times"
	"Flaps removeDuplicateFlapTabs"
	| _gsSqueakTemp_tabs _gsSqueakTemp_duplicates |
	SharedFlapTabs copy
		ifNil: [^ self].
	_gsSqueakTemp_tabs := SharedFlapTabs copy.
	_gsSqueakTemp_duplicates := Set new.
	_gsSqueakTemp_tabs
		do: [:tab | 
			| same |
			same := _gsSqueakTemp_tabs
						select: [:each | each wording = tab wording].
			same isEmpty not
				ifTrue: [same removeFirst.
					_gsSqueakTemp_duplicates addAll: same]].
	SharedFlapTabs removeAll: _gsSqueakTemp_duplicates