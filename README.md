# xlsx_to_json

O projeto xlsx_to_json é uma ferramenta que permite processar um arquivo XLSX e gerar um objeto JSON a partir dele. Ele extrai os valores da primeira linha de cada coluna do arquivo XLSX e os utiliza como as chaves (keys) do objeto JSON, enquanto os valores restantes nas respectivas colunas são utilizados como os valores (values) correspondentes no objeto JSON resultante.

## Requisitos
Certifique-se de ter os seguintes requisitos instalados em seu ambiente de desenvolvimento:

Ruby (versão mais recente)
Bundler (para instalar as dependências)

## Instalação
**Siga os passos abaixo para configurar e executar o projeto:**

Faça o clone deste repositório para o seu ambiente local.

Navegue até o diretório do projeto:

```bash
cd xlsx_to_json
```

Execute o comando abaixo para instalar as dependências:

```bash
bundle install
```

Para listar as tasks:

```bash
rake --tasks
```
## Uso
O projeto possui as seguintes tarefas disponíveis:

```bash
rake generate:json[file_path]
```
A tarefa generate:json processa o arquivo XLSX especificado (file_path) e gera o objeto JSON resultante. Substitua file_path pelo caminho para o arquivo XLSX que deseja processar. Por exemplo:

```bash
rake generate:json['caminho/para/arquivo.xlsx']
```

O resultado será um arquivo JSON gerado a partir do arquivo XLSX, seguindo a lógica descrita anteriormente.

```bash
rake xlsx:keys[file_path]
```

A tarefa xlsx:keys lista as chaves extraídas do arquivo XLSX especificado (file_path). Substitua file_path pelo caminho para o arquivo XLSX que deseja processar. Por exemplo:

```bash
rake xlsx:keys['caminho/para/arquivo.xlsx']
```

A saída será uma lista das chaves extraídas da primeira linha de cada coluna no arquivo XLSX.

```bash
rake xlsx:object_values[file_path]
```

A tarefa xlsx:object_values lista os valores extraídos do arquivo XLSX especificado (file_path). Substitua file_path pelo caminho para o arquivo XLSX que deseja processar. Por exemplo:

O arquivo **user.xlsx** em **/public** pode ser utilizado para testar as funcionalidades

```bash
rake generate:json["public/user.xlsx"]
```
```bash
rake xlsx:keys["public/user.xlsx"] 
```
```bash
rake xlsx:object_values["public/user.xlsx"]
```

## Contribuindo

Se você encontrar algum problema ou tiver alguma sugestão de melhoria, fique à vontade para abrir uma issue neste repositório. Sua contribuição é muito bem-vinda!