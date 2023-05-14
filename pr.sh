echo "Opening a Pull Request"

curl -X 'POST' \
  'https://api.github.com/repos/SaiPisey2/gitops-argocd/pulls' \
  -H 'accept: application/vnd.github+json' \
  -H "authorization: $ARGOCD_TOKEN" \
  -H 'Content-Type: application/vnd.github+json' \
  -d '{
  "assignee": "SaiPisey2",
  "assignees": [
    "SaiPisey2"
  ],
  "base": "main",
  "body": "Updated deployment specification with a new image version.",
  "head": "feature-gitea",
  "title": "Updated Solar System Image"
}'

echo "Success"