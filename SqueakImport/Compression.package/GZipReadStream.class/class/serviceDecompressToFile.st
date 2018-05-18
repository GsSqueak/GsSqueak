fileIn/Out
serviceDecompressToFile

	^ FileModifyingSimpleServiceEntry 
				provider: self 
				label: 'decompress to file' translatedNoop
				selector: #saveContents:
				description: 'decompress to file' translatedNoop