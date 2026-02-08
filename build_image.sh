export APPS_JSON_BASE64=$(base64 -w 0 apps.json)
echo -n ${APPS_JSON_BASE64} | base64 -d

sudo docker build \
--build-arg=FRAPPE_PATH=https://gitee.com/mirrors/frappe \
--build-arg=FRAPPE_BRANCH=version-15 \
--build-arg=APPS_JSON_BASE64=$APPS_JSON_BASE64 \
--tag=myerp:version-15 \
--file=images/layered/Containerfile .
