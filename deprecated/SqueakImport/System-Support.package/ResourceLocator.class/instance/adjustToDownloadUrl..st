accessing
adjustToDownloadUrl: downloadUrl
	"Adjust to the fully qualified URL for this resource."
	self urlString: (ResourceLocator make: self urlString relativeTo: downloadUrl) unescapePercents