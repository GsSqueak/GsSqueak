instance creation
openFileDirectly
	StandardFileMenu oldFile
		ifNotNil: [:_gsSqueakTemp_aResult | self
				openEditorOn: (_gsSqueakTemp_aResult directory readOnlyFileNamed: _gsSqueakTemp_aResult name)
				editString: nil]