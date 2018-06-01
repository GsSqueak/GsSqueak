browse
browseMyChanges
	"Browse only the changes (in the changes file) by the current author."

	"SystemNavigation default browseMyChanges"

	self browseAllSelect: [ :method |
       method fileIndex > 1 "only look at changes file"
               and: [ method timeStamp beginsWith: Utilities authorInitials ]]