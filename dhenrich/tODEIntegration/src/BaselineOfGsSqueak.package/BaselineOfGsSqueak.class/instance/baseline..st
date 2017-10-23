baseline
baseline: spec
  <baseline>
  spec
    for: #'gs643.4.x'
    do: [ 
      spec
        package: 'GsSqueak-ProoofOfConcept1-GsSqueak';
        package: 'GsSqueak-ProoofOfConcept2-GsSqueak';
        yourself ].
  spec
    for: #'gs3.4.x'
    do: [ 
      spec
        package: 'Cypress-Environmental-Tools';
        package: 'GsSqueak-Tode-ProofOfConcept'
          with: [ 
              spec
                requires: #('Cypress-Environmental-Tools');
                postLoadDoIt: #'installGsSqueakProofOfConcept' ];
        yourself.
      spec
        group: 'default' with: #('ProofOfConcept');
        group: 'Tools' with: #('Cypress-Environmental-Tools');
        group: 'ProofOfConcept' with: #('GsSqueak-Tode-ProofOfConcept');
        yourself ]