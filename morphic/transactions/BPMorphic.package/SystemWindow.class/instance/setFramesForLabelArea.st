initialization
setFramesForLabelArea
	"an aid to converting old instances, but then I found 
	convertAlignment (jesse welton's note)"
	| _gsSqueakTemp_frame |
	labelArea
		ifNil: [^ self].
	labelArea layoutPolicy: TableLayout new;
		 listDirection: #leftToRight;
		 hResizing: #spaceFill;
		 layoutInset: 0.
	label hResizing: #spaceFill.
	labelArea
		ifNotNil: [_gsSqueakTemp_frame := LayoutFrame new.
			_gsSqueakTemp_frame leftFraction: 0;
				 topFraction: 0;
				 rightFraction: 1;
				 bottomFraction: 0;
				 topOffset: self labelHeight negated.
			labelArea layoutFrame: _gsSqueakTemp_frame]