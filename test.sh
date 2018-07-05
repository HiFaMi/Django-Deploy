#!/usr/bin/env bash

IDENTITY_FILE="$HOME/.ssh/fc-kmg.pem"
USER="ubuntu"
HOST="ec2-13-209-77-105.ap-northeast-2.compute.amazonaws.com"
PROJECT_DIR="$HOME/project/deploy/ec2-deploy"
SERVER_DIR="/home/ubuntu/project"
# ssh로 접속하는 명령어
CMD_CONNECT="ssh -i ${IDENTITY_FILE} ${USER}@${HOST}"

# 서버 접속 후 SERVER_DIR로 이동, pipenv --venv로 가상환경의 경로 가져오기
VENV_PATH=$(${CMD_CONNECT} "cd ${SERVER_DIR} && pipenv --venv")
# 가상환경의 경로에 /bin/python을 붙여 서버에서 사용하는 python의 경로 만들기
PYTHON_PATH="${VENV_PATH}/bin/python"
echo $PYTHON_PATH

# runserver를 background에서 실행시켜주는 커맨드 (nohup)
RUNSERVER_CMD="nohup ${PYTHON_PATH} manage.py runserver 0:8000 &"
echo $RUNSERVER_CMD

# 서버 접속 후, 프로젝트의 'app'폴더까지 이동한 후 runserver명령어를 실
${CMD_CONNECT} "cd ${SERVER_DIR}/app && ${RUNSERVER_CMD}"
echo "End"

