echo "Opening a Pull Request"

curl -X POST -H "Authorization: $ARGOCD_TOKEN" -d "{\\"title\\":\\"My Pull Request Title\\",\\"head\\":\\"feature-gitea\\",\\"base\\":\\"main\\"}" https://api.github.com/repos/SaiPisey2/gitops-argocd/pulls
echo "Success only 2"