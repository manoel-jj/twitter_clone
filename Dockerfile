FROM python:3.10.5

# Definir diretório de trabalho
WORKDIR /app

# Copiar o pyproject.toml e poetry.lock
COPY pyproject.toml poetry.lock /app/

# Instalar dependências do Poetry
RUN pip install --no-cache-dir poetry==1.8.3

# Desativar a criação de ambientes virtuais pelo Poetry
RUN poetry config virtualenvs.create false

# Instalar as dependências do projeto
RUN poetry install --no-dev

# Copiar o restante do código do projeto
COPY . /app/

# Expor a porta que a aplicação usará
EXPOSE 8000

# Comando para rodar o servidor
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
