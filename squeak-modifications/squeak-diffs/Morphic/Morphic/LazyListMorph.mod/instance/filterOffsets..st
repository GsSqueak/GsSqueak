list access
filterOffsets: row
	"Get the character offsets for the matching filter term."
	
	| indexes |
	"Migrate old instances if necessary."
	listFilterOffsets ifNil: [listFilterOffsets := Array new: listItems size].
	
	row <= listFilterOffsets size ifFalse: [
		^ self getFilterOffsets: row].
	
	(indexes := listFilterOffsets at: row) ifNil: [
		indexes := self getFilterOffsets: row.
		listFilterOffsets at: row put: indexes ].
	
	^ indexes