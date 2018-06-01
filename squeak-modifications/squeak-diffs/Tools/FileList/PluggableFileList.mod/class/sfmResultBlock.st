resultBlocks
sfmResultBlock

	^[:theDirectory :theFileName | 
		StandardFileMenuResult directory: theDirectory name: theFileName]