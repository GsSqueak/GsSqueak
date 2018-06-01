I want to be merged into PolygonMorph.
I implement Closed Cubic Curves and restructured routines to ease maintence and development.



New way to calculate curves.

cVariables
SlopeConstantsCache anArray size 2  indexed by nVerts \\2 .
		Each element is an array of integers. The integers represent the constants for
 		calculating slopes for closed cubic curves from the vertices. 




Class Variable SlopeConstantsCache holds a pair of arrays for even and odd number of vertices( aka knots).
Each array holds a series of constants in Integer form.
This allows slopes to be calculated directly from the array of knots.
Wonderfully it turns out that only two arrays are needed.
By matching up the knots equidistant from the point in question;
Summing the weighted differences of the pairs the unscaled slope can be arrived at.
The scale needed to get the slopes needed is trice the reciprical of the next integer in the series.
We leave the division til last to get the full benifit of the integer arithmetic.

Rounding the vertices before calculation is recommended.


Instead of calculating the number of curve subsegments in lineSegDo we add a ninth array to curve state to allow the number to be precalculated.
Getting better looking curves motivates finding a better way of guessing n. So this provides a framework for trying.

For the first pass we just used the constant 12 for every thing.
In the second pass we judge the number of segments by starting with two and doubling the number until the distance of the curve no longer increases.
Then we hone in using a binary search to find the smallest number of segments with that same curve length.


We have changed some assumptions. Previously curves were figured by solving for the second derivative  first and using the results to determine the slope and the third derivative. So lineSegDo counted on the last second deriv being a number it could use in its calculation of the number of subsegments.

Currently we just solve for slopes and the second and third derivs are derived from that. 
Also the derivation for the second and third derivs only assume C(1) (first derivitive continuity). The calculations for the slopes are the only calcs using C(2) continuity. Therefore the slopes can alternately be chosen to fit some other chriteria  and the resulting curves will still be smooth to the first degree.
A useful variant of closed slopes is to scale them by a constant.


Also the last of each element of curvestate always reflects a closing segment. And we don't add an extra row for closed curves anymore. 
That is now lineSegDo's responsibility to be aware of as it was already doing with segmented curves. So the last n does not track its old value.

Preferences:
A Preference has been added to toggle between the old (ugly) closed curves based on natural cubic slopes and the new smooth algorythim. This doesn't make much difference while newcurves are a subclass of polygons but the ambition is for newcurves to supercede polygons. This will allow backwards  compatibility.

Shapes: With closed curves a smooth oval results from rectagular or diamond vertices. So two menuitems have been added (to PolygonMorph) that allow the vertices to be set to these shapes using the current bounds of the polygon. The former state of vertices will be lost but it seems useful to lose a complicated shape and start fresh with a simple symmetrical one. 

Furthur on: Modify curveState to only contain slope and higher deriv information. Let the information about the knots only be held only in the vertices of the polygon. Once that is done curvestate will not have to be recalcutaled each time the polygon is moved but only when its shape changes.

There is also some possible speed up to be had by refining or experimenting with other number of segment calculating schemes but not as much as preserving curvestate over a move.

Furthur furthur on: Figure out how to combine straight and curved segments into a single shape in a pleasing way.

 







