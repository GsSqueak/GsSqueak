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
  ^ extSession forkString: 'Smalltalk processStartUpList: true.
[true] whileTrue: [(Delay forMilliseconds: 1000) wait.].'.
