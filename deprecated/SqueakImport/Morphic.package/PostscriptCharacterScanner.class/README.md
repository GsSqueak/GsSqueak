I am a simple character scanner that forwards text-drawing commands to my canvas.  Despite the name, it should also work with other Canvases that actually implement the text-drawing commands (which the basic FormCanvas does not).

Style text support currently includes color, centering, fonts and emphasis.  Not yet supported are embedded objects, full justification and probably some others as well.

Tabs aren't supported properly, but rather hacked in the Postscript Header provided by PostscriptCanvas to be equivalent to 4 space.

mpw.
