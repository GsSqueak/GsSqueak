editors
bitEdit: aForm
	"Create and schedule a view located in an area designated by the user 
	that contains a view of the receiver magnified by 8@8 that can be 
	modified using the Bit Editor. It also contains a view of the original 
	form."

	aForm currentHand attachMorph: (FatBitsPaint new editForm: aForm;
			 magnification: 8;
			 brushColor: Color black;
			 penSize: 1;
			 yourself)
