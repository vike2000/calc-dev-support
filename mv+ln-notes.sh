set -ef && shopt -s extglob

cd /∂/git/calc

# double check following as it's a simplification an not verbatim what / how it was run

git diff master -- .gitignore
cat custom/.gitignore

mkdir ../calc-dev-support

mv .vscode ../calc-dev-support/.vscode-support
ln -s ../calc-dev-support/.vscode-support .vscode

cp custom/.gitignore ../calc-dev-support/custom/.gitignore-support # can't symlink .gitignore

mv clang-format-testee.c ../calc-dev-support
ln -s ../calc-dev-support/clang-format-testee.c .

mkdir ../calc-dev-support/custom

mv custom/clang-format-testee.cal ../calc-dev-support/custom/
ln -s ../../calc-dev-support/clang-format-testee.cal custom/

(set +f && mv custom/pfe[-+]* ../calc-dev-support/custom)
(set +f && for s in ../calc-dev-support/custom/pfe[-+]!(*—*);do ln -s ../"$s" custom/;done)

cd ../calc-dev-support
git init
git remote add origin git@github.com:vike2000/calc-dev-support.git

git add .
git commit -m "initial commit"
