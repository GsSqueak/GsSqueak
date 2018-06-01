menu
addCustomMenuItems: aCustomMenu hand: aHandMorph

        super addCustomMenuItems: aCustomMenu hand: aHandMorph.
        aCustomMenu 
                add: 'background color' translated action: #setBackgroundColor:;
                add: 'pen color' translated action: #setPenColor:;
                add: 'pen size' translated action: #setPenSize:;
                add: 'fill' translated action: #fill;
                add: 'magnification' translated action: #setMagnification:;
                add: 'accept' translated action: #accept;
                add: 'revert' translated action: #revert;
                add: 'inspect' translated action: #inspectForm;
                add: 'file out' translated action: #fileOut;
                add: 'selection...' translated action: #selectionMenu:;
                add: 'tools...' translated action: #toolMenu: