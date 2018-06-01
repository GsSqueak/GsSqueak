explain
explainScan: string 
	"Remove beginning and trailing space, tab, cr.
	1/15/96 sw: copied intact from BrowserCodeController"
	| _gsSqueakTemp_c _gsSqueakTemp_beg _gsSqueakTemp_end |
	_gsSqueakTemp_beg := 1.
	_gsSqueakTemp_end := string size.
	[_gsSqueakTemp_beg = _gsSqueakTemp_end
		ifTrue: [^ string copyFrom: 1 to: 1].
	"if all blank, tell about the first"
	_gsSqueakTemp_c := string at: _gsSqueakTemp_beg.
	_gsSqueakTemp_c = Character space
		or: [_gsSqueakTemp_c = Character tab
				or: [_gsSqueakTemp_c = Character cr]]]
		whileTrue: [_gsSqueakTemp_beg := _gsSqueakTemp_beg + 1].
	[_gsSqueakTemp_c := string at: _gsSqueakTemp_end.
	_gsSqueakTemp_c = Character space
		or: [_gsSqueakTemp_c = Character tab
				or: [_gsSqueakTemp_c = Character cr]]]
		whileTrue: [_gsSqueakTemp_end := _gsSqueakTemp_end - 1].
	^ string copyFrom: _gsSqueakTemp_beg to: _gsSqueakTemp_end"Return purely visible characters"