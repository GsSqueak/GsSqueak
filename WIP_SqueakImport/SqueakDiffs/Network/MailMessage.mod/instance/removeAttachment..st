multipart
removeAttachment: aMIMEDocument

	^ self body parts remove: aMIMEDocument ifAbsent: []