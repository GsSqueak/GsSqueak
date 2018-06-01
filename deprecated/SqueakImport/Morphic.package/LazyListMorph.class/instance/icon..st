list access
icon: row
	
	| icon |
	"Migrate old instances if necessary."
	listIcons ifNil: [listIcons := Array new: listItems size].
	
	row <= listIcons size ifFalse: [
		^ self getListIcon: row].
	
	(icon := listIcons at: row) ifNil: [
		icon := self getListIcon: row.
		listIcons at: row put: icon ].
	
	^ icon