echo "Opening a Pull Request"

gh api \
  --method POST \
  -H "Accept: application/vnd.github+json" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  /repos/SaiPisey2/gitops-argocd/pulls \
  -f title='Amazing new feature yes!' \
 -f body='Please pull these awesome changes in!' \
 -f head='feature-gitea' \
 -f base='main'

echo "Success"