private
rows: rows columns: columns contents: anArray
	self assert: [rows isInteger and: [rows >= 0]].
	self assert: [columns isInteger and: [columns >= 0]].
	self assert: [rows * columns = anArray size].
	nrows := rows.
	ncols := columns.
	contents := anArray.
	^self