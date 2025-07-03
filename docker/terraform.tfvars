# Variables pour MongoDB
mongo_image        = "mongo:6"
mongo_user         = "root"
mongo_password     = "example"
mongo_database     = "blog"

# Variables pour MySQL
mysql_image        = "mysql:8"
mysql_root_password= "example"
mysql_database     = "users"

# Variable pour Adminer
adminer_image      = "adminer:latest"

# Images custom à renseigner (exemple)
node_image   = "andreascastello06/express_mongodb_app_ynov:latest"
python_image = "andreascastello06/ci_cd_fastapi_ynov:latest"
react_image  = "andreascastello06/ci_cd_react_ynov:latest" 