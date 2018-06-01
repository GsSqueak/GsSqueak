initialization
vertices: verts borderWidth: bw borderColor: bc 
	super initialize.
	vertices := verts.
	
	borderWidth := bw.
	borderColor := bc.
	closed := false.
	arrows := #none.
	self computeBounds