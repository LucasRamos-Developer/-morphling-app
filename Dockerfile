FROM ruby:3.0.2

# Instalar as dependências do sistema
RUN apt-get update && apt-get install -y build-essential libpq-dev nodejs

# Configurar o diretório de trabalho
WORKDIR /app

# Instalar as dependências da aplicação
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copiar o código-fonte da aplicação
COPY . .

# Expor a porta 3000
EXPOSE 3000

# Iniciar a aplicação
CMD ["rails", "server", "-b", "0.0.0.0"]
