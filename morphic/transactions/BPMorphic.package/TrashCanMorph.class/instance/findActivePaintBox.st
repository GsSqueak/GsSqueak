private
findActivePaintBox
	"If painting, return the active PaintBoxMorph. If not painting,
	or if the paint box cannot be found, return nil."
	| _gsSqueakTemp_w |
	_gsSqueakTemp_w := self world.
	_gsSqueakTemp_w
		ifNil: [^ nil].
	(_gsSqueakTemp_w findA: SketchEditorMorph)
		ifNil: [^ nil].
	"not painting"
	(_gsSqueakTemp_w findA: PaintBoxMorph)
		ifNotNil: [:_gsSqueakTemp_m | ^ _gsSqueakTemp_m].
	^ nil