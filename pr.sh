echo "Opening a Pull Request"

curl -X POST -H "Authorization: token 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" -d "{\\"title\\":\\"My Pull Request Title\\",\\"head\\":\\"feature-gitea\\",\\"base\\":\\"main\\"}" https://api.github.com/repos/SaiPisey2/gitops-argocd/pulls
echo "Success only 2"