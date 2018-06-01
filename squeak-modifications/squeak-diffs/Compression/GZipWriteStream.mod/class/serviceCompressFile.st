file list services
serviceCompressFile

	^ FileModifyingSimpleServiceEntry 
				provider: self 
				label: 'compress file' translatedNoop
				selector: #compressFile:
				description: 'compress file using gzip compression, making a new file' translatedNoop