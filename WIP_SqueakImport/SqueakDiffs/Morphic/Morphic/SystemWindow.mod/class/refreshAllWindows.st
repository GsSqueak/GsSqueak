initializing
refreshAllWindows
	"If there is some prominent UI change, use this method to update all open windows."
	
	SystemWindow allSubInstances do: [:w |
		w
			replaceBoxes;
			setDefaultParameters;
			refreshWindowColor].