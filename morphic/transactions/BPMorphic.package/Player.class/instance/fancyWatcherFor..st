slots-user
fancyWatcherFor: aGetter 
	"Anser a labeled readout for viewing a value textuallyi"
	| _gsSqueakTemp_aWatcher _gsSqueakTemp_aColor _gsSqueakTemp_aLine _gsSqueakTemp_itsName _gsSqueakTemp_aSelector _gsSqueakTemp_aLabel |
	_gsSqueakTemp_aWatcher := self unlabeledWatcherFor: aGetter.
	_gsSqueakTemp_aColor := Color
				r: 0.387
				g: 0.581
				b: 1.0.
	_gsSqueakTemp_aLine := WatcherWrapper newRow.
	_gsSqueakTemp_aLine player: self variableName: (_gsSqueakTemp_aSelector := aGetter inherentSelector).
	_gsSqueakTemp_itsName := _gsSqueakTemp_aWatcher externalName.
	_gsSqueakTemp_aWatcher setNameTo: 'readout'.
	_gsSqueakTemp_aLine addMorphFront: (self tileReferringToSelf borderWidth: 0;
			 layoutInset: 4 @ 0;
			 typeColor: _gsSqueakTemp_aColor;
			 color: _gsSqueakTemp_aColor;
			 bePossessive).
	_gsSqueakTemp_aLabel := StringMorph contents: _gsSqueakTemp_aSelector translated , ' = ' font: ScriptingSystem fontForTiles.
	_gsSqueakTemp_aLabel setProperty: #watcherLabel toValue: true.
	_gsSqueakTemp_aLine addMorphBack: _gsSqueakTemp_aLabel.
	_gsSqueakTemp_aLine addMorphBack: _gsSqueakTemp_aWatcher.
	_gsSqueakTemp_aLine setNameTo: _gsSqueakTemp_itsName.
	^ _gsSqueakTemp_aLine