#!/bin/bash
# Repo Bootstrap CLI (Bash version)
# ใช้สำหรับสร้างโครงสร้างเริ่มต้นของโปรเจกต์แบบ explicit

REPO_NAME=${1:-my-project}
mkdir -p "$REPO_NAME"/{.github/workflows,config,templates,playground,docs}

# .github
cat <<EOF > "$REPO_NAME/.github/labels.yml"
# ใช้ร่วมกับ GitHub Actions เพื่อ sync labels อัตโนมัติ
labels:
  - { name: "type:feature", color: "1f77b4", description: "ฟีเจอร์ใหม่" }
  # ... เพิ่มตามที่คุณให้ไว้
EOF

touch "$REPO_NAME/.github/PULL_REQUEST_TEMPLATE.md"
touch "$REPO_NAME/.github/workflows/ci.yml"

# config
echo "# plugin.yaml: ใช้สำหรับ plugin manifest" > "$REPO_NAME/config/plugin.yaml"
echo "// manifest.ts: ใช้สำหรับ template rendering logic" > "$REPO_NAME/config/manifest.ts"
echo "{ \"tools\": [] }" > "$REPO_NAME/config/tool-list.json"

# templates
echo "{ \"template\": \"default\" }" > "$REPO_NAME/templates/default.template.json"

# playground
echo "{ \"props\": {} }" > "$REPO_NAME/playground/props.json"

# docs
echo "# README for $REPO_NAME" > "$REPO_NAME/docs/README.md"
touch "$REPO_NAME/docs/CHANGELOG.md"
touch "$REPO_NAME/docs/architecture.md"

# root files
touch "$REPO_NAME/CODEOWNERS"
touch "$REPO_NAME/LICENSE"
touch "$REPO_NAME/SECURITY.md"
touch "$REPO_NAME/CONTRIBUTING.md"

echo "✅ Repo '$REPO_NAME' scaffolded successfully."
