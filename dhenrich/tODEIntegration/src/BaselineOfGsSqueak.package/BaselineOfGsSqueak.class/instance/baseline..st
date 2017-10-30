baseline
baseline: spec
  <baseline>
  spec
    for: #'gsc3.4.x'
    do: [ 
      spec
        package: 'Cypress-Environmental-Tools';
        package: 'GsSqueak-ProofOfConcept0'
          with: [ spec requires: 'Cypress-Environmental-Tools' ];
        yourself.
      spec
        group: 'default' with: #( 'GsSqueak-ProofOfConcept0' );
        yourself ].
  spec
    for: #'gs643.4.x'
    do: [ 
      spec
        package: 'GsSqueak-ProofOfConcept1';
        package: 'GsSqueak-ProofOfConcept2';
        yourself ].
  spec
    for: #'gs3.4.x'
    do: [ 
      spec
        package: 'GsSqueak-Tode-Extensions';
        yourself.
      spec
        group: 'default' with: #( 'GsSqueak-Tode-Extensions' );
        yourself ].

