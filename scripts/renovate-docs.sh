#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
HELM_DOCS_VERSION="${HELM_DOCS_VERSION:-1.14.2}"
CLEANUP_DIRS=()

cleanup() {
  local status=$?
  for dir in "${CLEANUP_DIRS[@]-}"; do
    rm -rf "$dir"
  done
  exit $status
}
trap cleanup EXIT

ensure_tool() {
  if command -v "$1" >/dev/null 2>&1; then
    return 0
  fi
  echo "Missing required command: $1" >&2
  exit 1
}

download_helm_docs() {
  ensure_tool curl
  ensure_tool tar

  local os arch archive url tmpdir
  os="$(uname -s)"
  arch="$(uname -m)"

  case "$arch" in
    x86_64 | amd64) arch="x86_64" ;;
    arm64 | aarch64) arch="arm64" ;;
    *)
      echo "Unsupported architecture for helm-docs: $arch" >&2
      exit 1
      ;;
  esac

  archive="helm-docs_${HELM_DOCS_VERSION}_${os}_${arch}.tar.gz"
  url="https://github.com/norwoodj/helm-docs/releases/download/v${HELM_DOCS_VERSION}/${archive}"

  tmpdir="$(mktemp -d)"
  CLEANUP_DIRS+=("$tmpdir")

  echo "Downloading helm-docs v${HELM_DOCS_VERSION} from ${url}" >&2
  curl -fsSL "$url" -o "${tmpdir}/${archive}"
  tar -xzf "${tmpdir}/${archive}" -C "$tmpdir"
  chmod +x "${tmpdir}/helm-docs"

  echo "${tmpdir}/helm-docs"
}

resolve_helm_docs() {
  if [[ -n "${HELM_DOCS_BIN:-}" ]]; then
    echo "$HELM_DOCS_BIN"
    return 0
  fi

  if command -v helm-docs >/dev/null 2>&1; then
    command -v helm-docs
    return 0
  fi

  download_helm_docs
}

run_helm_docs() {
  local chart_dir="$1"
  local helm_docs_bin="$2"

  if [[ ! -f "${chart_dir}/HELM.md.gotmpl" ]]; then
    echo "Skipping ${chart_dir}: no HELM.md.gotmpl template found"
    return 0
  fi

  echo "Generating documentation for ${chart_dir}"
  "$helm_docs_bin" \
    --chart-search-root "${chart_dir}" \
    --output-file=HELM.md \
    --template-files=HELM.md.gotmpl \
    --skip-version-footer \
    --sort-values-order=file
}

main() {
  local helm_docs_bin
  helm_docs_bin="$(resolve_helm_docs)"

  if [[ ! -x "$helm_docs_bin" ]]; then
    echo "helm-docs binary is not executable: $helm_docs_bin" >&2
    exit 1
  fi

  for chart in "${REPO_ROOT}"/charts/*; do
    [[ -d "$chart" ]] || continue
    run_helm_docs "$chart" "$helm_docs_bin"
  done
}

main "$@"
