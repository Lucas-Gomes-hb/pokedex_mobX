# Pokédex Flutter App

Uma aplicação Flutter que consome a [PokéAPI](https://pokeapi.co/) para exibir informações sobre Pokémon. Este projeto foi desenvolvido como parte de um teste técnico para desenvolvedor Flutter júnior.

![Pokémon Banner](https://raw.githubusercontent.com/PokeAPI/media/master/logo/pokeapi_256.png)

## 📱 Funcionalidades

### Lista de Pokémon
- Exibição em grid de Pokémon com suas imagens e nomes
- Loading state com indicador de progresso
- Tratamento de erros com opção de retry
- Navegação para detalhes ao tocar em um Pokémon

### Detalhes do Pokémon
- Imagem oficial em alta resolução
- Informações detalhadas:
  - Número do Pokémon
  - Altura e peso
  - Tipos
  - Habilidades
- Design responsivo e intuitivo

## 🛠️ Tecnologias Utilizadas

- **Flutter**: Framework para desenvolvimento multiplataforma
- **MobX**: Gerenciamento de estado
- **Dio**: Cliente HTTP para consumo da API
- **GetIt**: Injeção de dependências
- **Cached Network Image**: Cache de imagens

## 📦 Estrutura do Projeto

```
lib/
  ├── core/
  │   ├── constants/
  │   └── errors/
  ├── features/
  │   └── pokemon/
  │       ├── data/
  │       ├── domain/
  │       ├── presentation/
  │       └── services/
  └── main.dart
```

## 🚀 Como Executar

### Pré-requisitos

- Flutter SDK instalado
- Android Studio/VSCode com plugins Flutter
- Emulador ou dispositivo físico conectado

### Passo a passo

1. Clone o repositório
```bash
git clone https://github.com/seu-usuario/pokemon-app.git
```

2. Navegue até a pasta do projeto
```bash
cd pokemon-app
```

3. Instale as dependências
```bash
flutter pub get
```

4. Gere os arquivos do MobX
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

5. Execute o projeto
```bash
flutter run
```

## 📝 Requisitos do Teste

✅ Lista de Pokémon com imagens  
✅ Tela de detalhes completa  
✅ Consumo da PokéAPI  
✅ Requisições assíncronas  
✅ Design intuitivo e agradável  
✅ Tratamento de erros  
✅ Gerenciamento de estado com MobX  
✅ Cached Network Image para imagens

## 🤝 Contribuições

Contribuições são bem-vindas! Sinta-se à vontade para abrir uma issue ou enviar um pull request.

## 📄 Licença

Este projeto está sob a licença MIT - veja o arquivo [LICENSE.md](LICENSE.md) para detalhes.

## 👤 Autor

[Seu Nome]
- LinkedIn: [@Lucas Gomes](https://www.linkedin.com/in/lucas-gomes-3a7564189/)
- GitHub: [@Lucas Gomes](https://github.com/Lucas-Gomes-hb)
