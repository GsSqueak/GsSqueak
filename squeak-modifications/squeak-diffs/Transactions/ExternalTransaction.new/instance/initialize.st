creation
initialize
  extSession := GsExternalSession new.
  extSession
    stoneNRS: GsNetworkResourceString defaultStoneNRSFromCurrent;
    gemNRS:
        (GsNetworkResourceString gemNRSForNetLDI: netldi onHost: 'localhost');
    username: 'DataCurator';
    password: 'swordfish'.
  extSession login.
  ^ extSession executeString: '^ 2 + 2' 
