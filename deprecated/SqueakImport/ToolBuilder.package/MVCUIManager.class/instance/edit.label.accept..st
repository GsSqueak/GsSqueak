ui requests
edit: aText label: labelString accept: anAction
	"Open an editor on the given string/text"

	Workspace new
		acceptContents: aText;
		acceptAction: anAction;
		openLabel: labelString
