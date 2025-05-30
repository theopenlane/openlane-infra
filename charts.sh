#!/bin/bash
for chart in charts/*; do
  if [[ -d "$chart" ]]; then
    echo "Generating documentation for $chart"
    helm-docs --chart-search-root "$chart" --output-file "$chart/HELM.md" --template-files "HELM.md.gotmpl" --skip-version-footer --sort-values-order=file
  fi
done
