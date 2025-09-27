# Repo Bootstrap CLI (PowerShell version)
# ใช้สำหรับ Windows หรือ GitHub CLI

param(
  [string]$RepoName = "my-project"
)

$paths = @(
  "$RepoName/.github/workflows",
  "$RepoName/config",
  "$RepoName/templates",
  "$RepoName/playground",
  "$RepoName/docs"
)

foreach ($path in $paths) {
  New-Item -ItemType Directory -Path $path -Force | Out-Null
}

Set-Content "$RepoName/.github/labels.yml" "# labels.yml: ใช้สำหรับ sync labels อัตโนมัติ"
New-Item "$RepoName/.github/PULL_REQUEST_TEMPLATE.md" -ItemType File | Out-Null
New-Item "$RepoName/.github/workflows/ci.yml" -ItemType File | Out-Null

Set-Content "$RepoName/config/plugin.yaml" "# plugin.yaml: ใช้สำหรับ plugin manifest"
Set-Content "$RepoName/config/manifest.ts" "// manifest.ts: ใช้สำหรับ template rendering logic"
Set-Content "$RepoName/config/tool-list.json" '{ "tools": [] }'

Set-Content "$RepoName/templates/default.template.json" '{ "template": "default" }'
Set-Content "$RepoName/playground/props.json" '{ "props": {} }'

Set-Content "$RepoName/docs/README.md" "# README for $RepoName"
New-Item "$RepoName/docs/CHANGELOG.md" -ItemType File | Out-Null
New-Item "$RepoName/docs/architecture.md" -ItemType File | Out-Null

$rootFiles = @("CODEOWNERS", "LICENSE", "SECURITY.md", "CONTRIBUTING.md")
foreach ($file in $rootFiles) {
  New-Item "$RepoName/$file" -ItemType File | Out-Null
}

Write-Host "✅ Repo '$RepoName' scaffolded successfully."
