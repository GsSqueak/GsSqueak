actions
addAttachment

	textEditor
		ifNotNil: [self hasUnacceptedEdits ifTrue: [textEditor accept]].

	(FileChooserDialog openOn: FileDirectory default pattern: nil label: 'Choose attachment') ifNotNil: 
		[:fileName |
		FileStream readOnlyFileNamed: fileName do:
			[:file | 
			file binary.
			self messageText:
				((MailMessage from: self messageText asString)
					addAttachmentFrom: file withName: (FileDirectory localNameFor: fileName);  
				text)]]