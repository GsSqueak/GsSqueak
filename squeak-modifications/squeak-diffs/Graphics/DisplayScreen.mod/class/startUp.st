startUp
startUp  "DisplayScreen startUp"
	"Display setExtent: self actualScreenSize depth: Display nativeDepth."
	Display setExtent: 800 @ 600 depth: 32. 
	Display beDisplay
