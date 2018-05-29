multipart
attachments

	^ self body parts select: [:p | 
		(p fieldNamed: 'content-disposition' ifAbsent: [nil])
			ifNil: [false]
			ifNotNilDo: [:headerValue | headerValue mainValue = 'attachment' ]]