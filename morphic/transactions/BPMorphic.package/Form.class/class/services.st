file list services
services
	^ Array
		with: self serviceImageImports
		with: self serviceImageImportAndShowImports
		with: self serviceOpenImageInWindow
		with: self serviceImageAsBackground