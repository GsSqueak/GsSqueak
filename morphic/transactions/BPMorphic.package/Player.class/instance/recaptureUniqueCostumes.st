costume
recaptureUniqueCostumes
	"Recapture all unique sketch-like costumes. Debugging only."
	| _gsSqueakTemp_unique |
	costumes
		ifNil: [^ self].
	_gsSqueakTemp_unique := PluggableSet new
				equalBlock: [:s1 :s2 | s1 form == s2 form];
				
				hashBlock: [:s | s form scaledIdentityHash].
	_gsSqueakTemp_unique
		addAll: (costumes
				select: [:c | c isSketchMorph]).
	_gsSqueakTemp_unique := _gsSqueakTemp_unique asIdentitySet.
	costumes := costumes
				select: [:c | c isSketchMorph not
						or: [_gsSqueakTemp_unique includes: c]]