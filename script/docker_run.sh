
if [[ "$ENV_VAR" = "dev" || "$ENV_VAR" = "local" ]]
then
     docker run -d \
        --name app_name \
        -p 8080:8080 \
        --env-file .env.local	\
        ### same network with host
        --net=host \
        ###
        image_name
else
    if [[ "$ENV_VAR" = "prod" ]]
    then
        docker run -d \
            --name app_name \
            -p 8080:8080 \
            --env-file .env	\
            image_name
    else
        echo Missing ENV_VAR
    fi
fi
