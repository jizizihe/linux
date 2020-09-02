#repo_server
mkdir repo_server
cd repo_server
mkdir aa
cd aa
git init --bare
cd ../;mkdir bb; cd bb
mkdir cc;cd cc
git init --bare
cd ../; mkdir dd;cd dd
git init --bare
cd ../../;mkdir manifest.git; cd manifest.git
git init --bare
#repo 
cd ../../;mkdir -p repo/aa ;cd repo/aa;touch a1 a2
git init .
git add .
git commit -m "first init"

cd ../;mkdir -p bb/cc
cd bb/cc;touch c1 c2
git init .
git add .
git commit -a -m "first init"

cd ../../;mkdir -p bb/dd
cd bb/dd ;touch d1 d2
git init .
git add .
git commit -a -m "first init"

cd ../../;mkdir manifest/
cd manifest/
touch default.xml
git init .
git add .
git commit -a -m "first init"
#repo remote
cd ../aa/
git remote add origin ~/workspace/repo/repo/repo_server/aa
git push origin --all
cd ../bb/cc/;git remote add origin ~/workspace/repo/repo/repo_server/bb/cc
git push origin --all
cd ../dd/;git remote add origin ~/workspace/repo/repo/repo_server/bb/dd                                                                                                    
git push origin --all
cd ../../manifest/;git remote add origin ~/workspace/repo/repo/repo_server/manifest.git
git push origin --all  
