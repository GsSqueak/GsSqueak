configurations
configFileName
	"Answer the full path to the most recently loaded configuration file, or a default if
	no configuration file was previously loaded."

	^ configFileName
		ifNil: [configFileName := FileDirectory default pathName , FileDirectory slash , 'vmmaker.config']