#!/bin/bash
docker login -u rc2024  -p dckr_pat_DUWoNZlOYJlF7Wv7-_7tG6KlTVo

if [[ $GIT_BRANCH == "origin/dev" ]]; then
       sh 'chmod +x build.sh'
       sh './build.sh'
       docker-compose up -d

        docker tag test rc2024/dev
        docker push rc2024/dev

elif [[ $GIT_BRANCH == "origin/main" ]]; then
        sh 'chmod +x build.sh'
        sh './build.sh'
        docker-compose up -d

        docker tag test rc2024/prod
        docker push rc2024/prod

else
        echo "failed"
fi
