echo "Opening a Pull Request"

curl -L \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: $ARGOCD_TOKEN" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/SaiPisey2/gitops-argocd/pulls \
  -d '{"title":"Amazing new feature","body":"Please pull these awesome changes in!","head":"feature-gitea","base":"main"}'

echo "Success"