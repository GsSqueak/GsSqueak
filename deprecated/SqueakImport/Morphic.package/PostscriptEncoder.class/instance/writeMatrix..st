Postscript generation
writeMatrix:m
	self print:'[';
		write:m a11; print:' ';
		write:m a21; print:' ';
		write:m a12; print:' ';
		write:m a22; print:' ';
		write:m a13; print:' ';
		write:m a23; print:'] '.

