
if [[ "$ENV_VAR" = "dev" || "$ENV_VAR" = "local" ]]
then
     docker run -d \
        --name maytrics_chat_agentbot \
        -p 8080:8080 \
        --env-file .env.local	\
        ### same network with host
        --net=host \
        ###
        maytrics_chat_agentbot_image
else
    if [[ "$ENV_VAR" = "prod" ]]
    then
        docker run -d \
            --name maytrics_chat_agentbot \
            -p 8080:8080 \
            --env-file .env	\
            maytrics_chat_agentbot_image
    else
        echo Missing ENV_VAR
    fi
fi
