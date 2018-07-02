as yet unclassified
initialize
	extSession := GsExternalSession new.
	extSession
    stoneNRS: GsNetworkResourceString defaultStoneNRSFromCurrent;
    gemNRS:
        (GsNetworkResourceString gemNRSForNetLDI: '46870' onHost: 'localhost');
    username: 'DataCurator';
    password: 'swordfish'.
  extSession login.
