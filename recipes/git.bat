@echo off
call bat-configs.bat

set /p name="Name your new repo: " %=%
set name=%name: =-%
set /p descrip="Describe it: " %=%

set /p avprompt="1 to push to @%GITUSERNAME%, 2 to push to @owh-projects: " %=%

IF %avprompt%==1 (
    set avname="%GITUSERNAME%"
    set thispath="/user/repos"
) ELSE (
    set avname="owh-projects"
    set thispath="/orgs/owh-projects/repos"
)

md %name%
cd %name%
set /p base="Do you want to use the Dataomaha.com base template? (y/n) " %=%

IF %base%==y (
    curl -O https://raw.githubusercontent.com/OWH-projects/owh-base-template/master/index.html
    echo curled 'at template like a boss
) ELSE (
    echo ok cool thanks
)

curl -u "%GITUSERNAME%:%GITPW%" https://api.github.com%thispath% -i -X POST -H "Content-Type: application/json" -d "{\"name\": \"%name%\", \"auto_init\": true, \"private\": false, \"description\":\"%descrip%\"}"

git init
git remote add origin https://github.com/%avname%/%name%
git pull origin master
git add --a
git commit -m "we are doing this ... together!"
git push --set-upstream origin master