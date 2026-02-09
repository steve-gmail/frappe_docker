sudo docker compose --env-file custom.env \
  -f compose.yaml \
  -f overrides/compose.mariadb.yaml \
  -f overrides/compose.redis.yaml \
  -f overrides/compose.noproxy.yaml \
  config > compose.custom.yaml

sudo docker compose -p frappe -f compose.custom.yaml up -d

sudo docker compose -p frappe exec backend bench new-site \
  --mariadb-user-host-login-scope='%' \
  --admin-password=admin \
  --db-root-username=root \
  --db-root-password=root123 \
  --install-app erpnext \
  --set-default frontend

# sudo docker compose -p frappe exec backend bench --site frontend install-app hrms healthcare lending education erpnext_china
