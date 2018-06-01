housekeeping
cleanseScripts
	"Fix up various known structure errors in the uniclass relating to the
	scripts dctionary. Answer the number of fixes made."
	| _gsSqueakTemp_errs |
	scripts
		ifNil: [scripts := IdentityDictionary new].
	_gsSqueakTemp_errs := 0.
	(scripts includesKey: nil)
		ifTrue: [_gsSqueakTemp_errs := _gsSqueakTemp_errs + 1.
			scripts removeKey: nil].
	scripts
		keysAndValuesDo: [:sel :uniclassScript | uniclassScript
				ifNil: [_gsSqueakTemp_errs := _gsSqueakTemp_errs + 1.
					Transcript cr; show: ' fix type 1, nil scripts key'.
					scripts removeKey: sel]
				ifNotNil: [uniclassScript currentScriptEditor
						ifNil: [_gsSqueakTemp_errs := _gsSqueakTemp_errs + 1.
							Transcript cr; show: ' fix type 2, sel = ' , sel.
							self someInstance removeScriptWithSelector: uniclassScript selector]
						ifNotNil: [:ed | uniclassScript playerClassPerSe
								ifNil: [_gsSqueakTemp_errs := _gsSqueakTemp_errs + 1.
									Transcript cr; show: ' fix type 3, sel = ' , sel.
									uniclassScript playerClass: self selector: sel]
								ifNotNil: [ed scriptName ~= uniclassScript selector
										ifTrue: [_gsSqueakTemp_errs := _gsSqueakTemp_errs + 1.
											ed restoreScriptName: sel.
											Transcript cr; show: ' fix type 4, sel = ' , sel]]]]].
	^ _gsSqueakTemp_errs