menus
loadFromURL: urlString
	"Fetch the file, unarchive, unzip, and use as my font."

	| rawStrm |
	rawStrm := HTTPSocket httpGet: urlString. 	"Later use an HttpURL?"
	self font: (TTFontReader readFrom: rawStrm asUnZippedStream).
