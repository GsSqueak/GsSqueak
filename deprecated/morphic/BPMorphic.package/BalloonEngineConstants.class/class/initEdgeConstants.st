pool definition
initEdgeConstants
	"Initialize the edge constants"
	"Edge primitive types"
	GEPrimitiveEdge := 2.
	"External edge - not handled by the GE"
	GEPrimitiveWideEdge := 3.
	"Wide external edge"
	GEPrimitiveLine := 4.
	"Straight line"
	GEPrimitiveWideLine := 5.
	"Wide line"
	GEPrimitiveBezier := 6.
	"Quadratic bezier curve"
	GEPrimitiveWideBezier := 7.
	"Wide bezier curve"
	"Special flags"
	GEPrimitiveWide := 1.
	"Flag determining a wide primitive"
	GEPrimitiveWideMask := 254.
	"Mask for clearing the wide flag"
	GEEdgeFillsInvalid := 65536.
	"Flag determining if left/right fills of an edge are invalid"
	GEEdgeClipFlag := 131072.
	"Flag determining if this is a clip edge"
	"General edge state constants"
	GEXValue := 4.
	"Current raster x"
	GEYValue := 5.
	"Current raster y"
	GEZValue := 6.
	"Current raster z"
	GENumLines := 7.
	"Number of scan lines remaining"
	GEFillIndexLeft := 8.
	"Left fill index"
	GEFillIndexRight := 9.
	"Right fill index"
	GEBaseEdgeSize := 10.
	"Basic size of each edge"
	"General fill state constants"
	GEBaseFillSize := 4.
	"Basic size of each fill"
	"General Line state constants"
	GLXDirection := 10.
	"Direction of edge (1: left-to-right; -1: right-to-left)"
	GLYDirection := 11.
	"Direction of edge (1: top-to-bottom; -1: bottom-to-top)"
	GLXIncrement := 12.
	"Increment at each scan line"
	GLError := 13.
	"Current error"
	GLErrorAdjUp := 14.
	"Error to add at each scan line"
	GLErrorAdjDown := 15.
	"Error to subtract on roll-over"
	"Note: The following entries are only needed before the incremental
	state is computed. They are therefore aliased to the error values
	above "
	GLEndX := 14.
	"End X of line"
	GLEndY := 15.
	"End Y of line"
	GLBaseSize := 16.
	"Basic size of each line"
	"Additional stuff for wide lines"
	GLWideFill := 16.
	"Current fill of line"
	GLWideWidth := 17.
	"Current width of line"
	GLWideEntry := 18.
	"Initial steps"
	GLWideExit := 19.
	"Final steps"
	GLWideExtent := 20.
	"Target width"
	GLWideSize := 21.
	"Size of wide lines"
	"General Bezier state constants"
	GBUpdateData := 10.
	"Incremental update data for beziers"
	GBUpdateX := 0.
	"Last computed X value (24.8)"
	GBUpdateY := 1.
	"Last computed Y value (24.8)"
	GBUpdateDX := 2.
	"Delta X forward difference step (8.24)"
	GBUpdateDY := 3.
	"Delta Y forward difference step (8.24)"
	GBUpdateDDX := 4.
	"Delta DX forward difference step (8.24)"
	GBUpdateDDY := 5.
	"Delta DY forward difference step (8.24)"
	"Note: The following four entries are only needed before the
	incremental state is computed. They are therefore aliased to the
	incremental values above"
	GBViaX := 12.
	"via x"
	GBViaY := 13.
	"via y"
	GBEndX := 14.
	"end x"
	GBEndY := 15.
	"end y"
	GBBaseSize := 16.
	"Basic size of each bezier.
	Note: MUST be greater or equal to the size of lines"
	"Additional stuff for wide beziers"
	GBWideFill := 16.
	"Current fill of line"
	GBWideWidth := 17.
	"Current width of line"
	GBWideEntry := 18.
	"Initial steps"
	GBWideExit := 19.
	"Final steps"
	GBWideExtent := 20.
	"Target extent"
	GBFinalX := 21.
	"Final X value"
	GBWideUpdateData := 22.
	"Update data for second curve"
	GBWideSize := 28