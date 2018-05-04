path access
platformsPathText
	"return a Text for the path to the platform sources"
	[^vmMaker platformRootDirectory fullName asText] on: VMMakerException do:[^'Problem with directory name for platform code: enter correct path or consult help text' asText]