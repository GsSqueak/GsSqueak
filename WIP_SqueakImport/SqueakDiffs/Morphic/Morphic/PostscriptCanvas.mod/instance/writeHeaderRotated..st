private
writeHeaderRotated: rotateFlag 
	self writePSIdentifierRotated: rotateFlag.
	self writeProcset.
	self writeGlobalSetup: rotateFlag.