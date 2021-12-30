FROM node:17.3.0-alpine3.14
# mkdir: create the full directory, -p means that this line does not throw an error if the folder already exists
# chown: que este el bajo el usuario node, del grupo node. Especifica que la carpeta especificada pertenece al usuario: node, grupo: node
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
# WORKDIR: especifica el directorio actual donde se estara ejecutando las sentencias que vamos a especificar despues 
WORKDIR /home/node/app
# COPY se van a copiar los archivos necesarios para nuestra aplicacion en este caso se refiere a la carpeta app de nuestro proyecto
# './' -> significa el WORKDIR que especificamos anteriormente (/home/node/app)
COPY app/ ./
# USER: especifica que usuario va a tomar control 
USER node
# RUN: especifica las dependencias que se van a instalar para la aplicacion
RUN npm install
# EXPOSE: especifica a Docker en que puerto va a correr la aplicacion
EXPOSE 8080
# CMD: especifica que necesitamos que el Docker ejecuta una vez este arriba, por lo que en nuestro caso necesitamos que levante la aplicacion con el comando: node app
CMD ["node", "app"]