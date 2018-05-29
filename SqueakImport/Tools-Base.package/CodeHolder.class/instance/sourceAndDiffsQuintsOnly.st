controls
sourceAndDiffsQuintsOnly
	"Answer a list of quintuplets representing information on the alternative views available in the code pane for the case where the only plausible choices are showing source or either of the two kinds of diffs"

	^ #(
(source			togglePlainSource 		showingPlainSourceString	'source'			'the textual source code as writen')
(showDiffs		toggleRegularDiffing	showingRegularDiffsString	'showDiffs'		'the textual source diffed from its prior version')
(prettyDiffs		togglePrettyDiffing		showingPrettyDiffsString	'prettyDiffs'		'formatted textual source diffed from formatted form of prior version'))