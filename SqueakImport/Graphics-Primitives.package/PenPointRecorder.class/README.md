This class is a special kind of Pen that instead of actually drawing lines records the destination points for those lines. These points can later be accessed through my accessing method #points.

This can be useful when determining the boundaries of a drawing session.

Example:

| pen |
pen := PenPointRecorder new.
pen up; goto: 100@100; down; goto: 120@120.
Transcript cr;
	show: 'Bounding box for drawing: ';
	show: (Rectangle encompassing: pen points)

Implementation note: Shouldn't we override #drawFrom:to:withFirstPoint: instead, and what about #drawLoopX:Y:? Aren't we missing those calls?