# Usa una imagen base de Node.js
FROM node:18

# Establece el directorio de trabajo en el contenedor
WORKDIR /app

# Copia los archivos package.json y package-lock.json
COPY package*.json ./

# Instala las dependencias
RUN npm install

# Copia el resto de la aplicación
COPY . .

RUN chmod -R 755 /app

# Construye la aplicación Astro
RUN npm run build

# Expone el puerto en el que la aplicación se ejecutará
EXPOSE 4321

# Define el comando para ejecutar la aplicación
CMD ["npm", "start"]
