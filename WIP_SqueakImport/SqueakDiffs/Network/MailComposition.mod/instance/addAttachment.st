actions
addAttachment

	self saveFields.
	(FileChooserDialog openOn: FileDirectory default pattern: nil label: 'Choose attachment') ifNotNil:
		[:fileName |
		FileStream readOnlyFileNamed: fileName do: 
			[:file |
			file binary.
			mailMessage
				addAttachmentFrom: file
				withName: (FileDirectory localNameFor: fileName)].
			self changed: #messageText]. 