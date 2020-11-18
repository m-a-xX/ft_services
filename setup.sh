# install a new minikube
minikube delete
minikube start
eval $(minikube -p minikube docker-env)

# enable kubernetes dashboard
minikube addons enable dashboard

# install metallb and creaate deployment and speaker deamon
sh srcs/metallb/install.sh
kubectl create -f srcs/metallb/metallb.yaml

# deploy influxdb
docker build -t influxdb srcs/influxdb
kubectl apply -f srcs/influxdb/influxdb.yaml

# deploy ftps
docker build -t ftps srcs/ftps
kubectl apply -f srcs/ftps/ftps.yaml

# deploy mysql
docker build -t mysql srcs/mysql
kubectl apply -f srcs/mysql/mysql.yaml

# deploy phpmyadmin
docker build -t phpmyadmin srcs/phpmyadmin
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml

# deploy wordpress
docker build -t wordpress srcs/wordpress
kubectl apply -f srcs/wordpress/wordpress.yaml

# deploy nginx
docker build -t nginx srcs/nginx
kubectl apply -f srcs/nginx/nginx.yaml

# deploy grafana
docker build -t grafana srcs/grafana
kubectl apply -f srcs/grafana/grafana.yaml
