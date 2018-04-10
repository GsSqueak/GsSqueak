toolbuilder
buildWith: builder 
	| _gsSqueakTemp_windowSpec |
	_gsSqueakTemp_windowSpec := self buildWindowWith: builder specs: {(0 @ 0 corner: 1 @ 1)
					-> [self buildCodePaneWith: builder]}.
	^ builder build: _gsSqueakTemp_windowSpec