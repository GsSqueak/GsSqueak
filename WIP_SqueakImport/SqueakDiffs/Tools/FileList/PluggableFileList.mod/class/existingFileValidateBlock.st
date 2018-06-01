validateBlocks
existingFileValidateBlock

	^[:theDirectory :theFileName :theNewFiles | 
		(theNewFiles includes: theFileName) or:
			[(PluggableFileList okToOverwrite: theFileName)]].