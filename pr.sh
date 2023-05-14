echo "Opening a Pull Request"

curl -X 'POST' \
  'https://api.github.com/repos/SaiPisey2/gitops-argocd/pulls' \
  -H 'accept: application/json' \
  -H "authorization: $ARGOCD_TOKEN" \
  -H 'Content-Type: application/json' \
  -d '{
  "assignee": "sai",
  "assignees": [
    "sai-p"
  ],
  "base": "main",
  "body": "Updated deployment specification with a new image version.",
  "head": "feature-gitea",
  "title": "Updated Solar System Image"
}'

echo "Success"