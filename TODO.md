Current status as of 05/27/2025 MKA

- working on gcp-bootstrap + gcp-project-base charts, after getting chart and helpers to render into manifests left them as-is for now
- need to fully iterate through prod + dev yaml files and avlues inheriatance
- add dependencies to gcp-project (or base?) to reference all the sub-charts with discreet resources
- not yet tested the config controller boostrap shell scripts
- need to iterate back through all the tests / configurations as many values / configs were materially changed but I didn't update the tests at the time
- need to update argocd / external-dns / cert-manager charts with relevant values and/or add them to a similar templating structure as the gcp-bootstrap setup
- test dockerfiles (or delete them if not needed)
- add tasks to render output to the `rendered` directories
- update configsync/rootsync files with relevant paths based on new structure
- see if you can import contents of a readme from another readme (or figure out how we want to structure the generated helm-docs alongside information more relevant to humans using the charts)
- enumerate back through charts and add favicon links and such
- actually test + validate (and update docuemtnation around) the sealed secrets setup (or use GCP KMS / SOPS instead)
- add pre-commit and plumb up buildkite pipeline 