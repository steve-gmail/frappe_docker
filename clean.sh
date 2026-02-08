sudo docker compose -p frappe -f compose.custom.yaml stop
sudo docker compose -p frappe -f compose.custom.yaml down
sudo docker volume prune -a
