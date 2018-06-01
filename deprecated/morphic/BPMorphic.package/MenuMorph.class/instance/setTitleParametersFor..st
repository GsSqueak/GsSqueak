initialization
setTitleParametersFor: aMenuTitle
  aMenuTitle
    color: Color transparent;
    borderStyle: BorderStyle default;
    borderColor: (Color r: 0.6 g: 0.7 b: 1);
    borderWidth: 0;
    cornerStyle:
        (self wantsRoundedCorners
            ifTrue: [ #'rounded' ]
            ifFalse: [ #'square' ]);
    vResizing: #'shrinkWrap';
    wrapCentering: #'center';
    cellPositioning: #'center';
    cellInset: 5;
    layoutInset: (5 @ 0 corner: 5 @ 0)