accessing
downloadUrl
	"The url under which files will be accessible."
	^ (self urlFromServer: self server directories: {'programmatic'})
		, self slash