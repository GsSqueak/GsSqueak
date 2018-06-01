instance creation
openFileDirectly

	(FileChooserDialog openOn: FileDirectory default) ifNotNil:
		[:fileName | self openEditorOn: (FileStream readOnlyFileNamed: fileName) editString: nil]