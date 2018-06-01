private
fileNameFromFormattedItem: item
	"Extract fileName and folderString from a formatted fileList item string"

	| from to |
	self sortingByName
		ifTrue: [
			from := item lastIndexOf: $(.
			to := item lastIndexOf: $)]
		ifFalse: [
			from := item indexOf: $(.
			to := item indexOf: $)].
	^ (from * to = 0
		ifTrue: [item]
		ifFalse: [item copyReplaceFrom: from to: to with: '']) withBlanksTrimmed