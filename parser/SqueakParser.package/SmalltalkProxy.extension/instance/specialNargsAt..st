*SqueakParser-Dependencies
specialNargsAt: anInteger 
	"Answer the number of arguments for the special selector at: anInteger."

	^ self specialSelectors at: anInteger * 2