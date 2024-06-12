# NEOVIM
## Minha configuação para o Neovim

## Tecnologias que utilizo:
- C# (.Net 6, 7 e 8);
- Js/Ts;
- Python (Django);
- React;
- Angular

## Básico:
- Instalar o [Neovim](https://github.com/neovim/neovim/blob/master/INSTALL.md);
- Instalar o ripgrep (para que seja possível utilizar o Live Grep)
    - `sudo apt install ripgrep` (Ubuntu);
    - `sudo pacman -S ripgrep` (Arch);
    - ou utilizar o script ripgrep.sh que já valida e instala de acordo com a distro;
- Utilizar um terminal com suporte a [devicons](https://devicon.dev/);
- Utilizar uma [Nerd Font](https://www.nerdfonts.com/), eu gosto e utilizo a [Jetbrains Mono](https://www.programmingfonts.org/#jetbrainsmono)
- Instalar node (sugiro utilizar nvm);
- Instalar Python (sugiro utilizar o pyenv);
- Instalr .Net (as versões que você utiliza);

## Angular:
- Necessário instalar o language-server, utilizar o comando:
    - `npm i -g @angular/language-server`

## DotNet
### Instalar o netcoredbg para conseguir debugar
Baixe a última versão disponível do netcoredbg
`wget https://github.com/Samsung/netcoredbg/releases/download/3.1.0-1031/netcoredbg-linux-amd64.tar.gz`
Extraia para o caminho "/usr/local/bin":
`sudo tar -xzf netcoredbg-linux-amd64.tar.gz -C /usr/local/bin`

### Debugar:
A única forma que consegui fazer com que o debug seja o mais viável possível foi criar um launch.json em uma pasta .vscode dentro do projeto indicando o bin que será executado.
Tentei utilizar outras pastas, mas a única que ele reconheceu automaticamente foi a .vscode... (Caso alguém saiba mais e queira contribuir, ajudaria muito!!).
Para não ter que criar na mão toda vez esse launch.json, criei um comando no nvim:
- O comando é: GenerateLaunchJson e ele espera 3 parametros:
    - has_src: boolean (se seu caminho tem a pasta src);
    - net_version: string (ex: net8.0);
    - project_name: string (ex: WeatherForecast.Api)
- Exemplo completo:
    - `:GenerateLaunchJson true net8.0 WeatherForecast.Api`
Esses parâmetros impactam dois campos da chave "configurations" do launch.json:
- program;
- cwd;
O exemplo que criei acima deixariam esses campos assim:
- `"program": "${workspaceFolder}/src/WeatherForecast.Api/bin/Debug/net8.0/WeatherForecast.Api.dll"`
- `"cwd": "${workspaceFolder}/src/WeatherForecast.Api"`

