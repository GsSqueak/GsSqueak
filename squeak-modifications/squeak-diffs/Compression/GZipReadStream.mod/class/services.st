fileIn/Out
services

	^ Array 
		with: self serviceViewDecompress
		with: self serviceDecompressToFile
	