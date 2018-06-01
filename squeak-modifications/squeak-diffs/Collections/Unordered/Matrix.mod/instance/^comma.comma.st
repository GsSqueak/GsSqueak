copying
,, aMatrix
	"Answer a new matrix having the same number of columns as the receiver and aMatrix,
	 its rows being the rows of the receiver followed by the rows of aMatrix."

	self assert: [ncols = aMatrix columnCount].
	^self class rows: nrows + aMatrix rowCount columns: ncols
		contents: contents , aMatrix privateContents
