printing
storeOn: aStream
  aStream
    nextPutAll: '(' , self species name;
    nextPutAll: ' r: ';
    print: self red;
    nextPutAll: ' g: ';
    print: self green;
    nextPutAll: ' b: ';
    print: self blue;
    nextPutAll: ')'