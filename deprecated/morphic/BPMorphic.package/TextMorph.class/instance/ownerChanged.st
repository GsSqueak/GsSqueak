change reporting
ownerChanged
	| _gsSqueakTemp_priorEditor |
	super ownerChanged.
	container
		ifNotNil: [editor isNil
				ifTrue: [self releaseParagraph.
					(container isKindOf: TextContainer)
						ifTrue: ["May need to recompose due to changes in
							owner "
							self installEditorToReplace: nil.
							self releaseParagraph]]
				ifFalse: [_gsSqueakTemp_priorEditor := editor.
					self releaseParagraph.
					self installEditorToReplace: _gsSqueakTemp_priorEditor]]