resources
startResourceLoading
	"Abort loading resources"
	resourceManager ifNil:[^self].
	resourceManager adjustToDownloadUrl: self resourceUrl.
	resourceManager startDownload