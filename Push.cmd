@ECHO OFF

ECHO "Deploying updates to GitHub..."

set message=%1

if "%%1" == "" (
  set message="Updating Website Content"
)

hugo
git add .
git commit -m %message%
git push origin master