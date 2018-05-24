file list menu
fileContentsMenu: aMenu shifted: shifted
	"Construct aMenu to have items appropriate for the file browser's code pane, given the shift state provided"
	^ self menu: aMenu for: #(fileContentsMenu fileContentsMenuShifted:) shifted: shifted