cache access
generateURL
	"Generate an unused URL for an in-memory page."
	"SqueakPageCache generateURL"

	| sd |
	sd := ServerFile new on: 'file:./'.
	sd fileName: 'page1.sp'.
	^ SqueakPage new urlNoOverwrite: sd pathForFile
