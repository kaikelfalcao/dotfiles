# Meus dotfiles

Meu setup de Ubuntu + GNOME, gerenciado com [chezmoi](https://chezmoi.io).
Fica em `~/.local/share/chezmoi` (atalho: `dotcd`).

## Máquina nova

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b ~/.local/bin init --apply kaikelfalcao
```

Vai pedir a senha do sudo. Quando terminar:

1. Logout/login (zsh vira o shell padrão, extensões carregam, grupo `docker` passa a valer)
2. `gh auth login`
3. `docker run --rm hello-world` pra conferir o Docker
4. Opcional: `atuin login` pra sincronizar o histórico

## O que tem aqui

- **Shell:** zsh + autosuggestions, syntax-highlighting, completions, fzf-tab
- **Prompt:** Starship, preset bracketed segments
- **Linguagens (mise):** Go, Node LTS, Python 3.14
- **CLIs (mise):** eza, bat, fd, ripgrep, fzf, zoxide, atuin, lazygit, delta, gh, yq, tldr, gitleaks, topgrade
- **CLIs (apt):** jq, btop, fastfetch, wl-clipboard, xclip
- **Fontes:** JetBrainsMono, FiraCode, CascadiaCode (Nerd Fonts), JetBrainsMono como mono do sistema
- **GNOME:** Tweaks, Extension Manager, Caffeine, Clipboard Indicator
- **Flatpak:** Bazaar, Flatseal, Chrome, Discord, Spotify
- **Editores:** VS Code (repo apt da Microsoft), Zed (instalador oficial)
- **Docker:** Engine oficial + Compose + Buildx, sem sudo
- **Git:** delta como pager, gh como credential helper, aliases

## Onde mexer pra cada coisa

| Quero... | Arquivo |
|---|---|
| Instalar/atualizar uma linguagem ou CLI | `dot_config/mise/config.toml` |
| Adicionar app Flatpak ou extensão do GNOME | `.chezmoidata/packages.yaml` |
| Pacote apt novo | `run_once_before_10-install-packages.sh.tmpl` |
| Alias, função, config do shell | `dot_zshrc` |
| Algo só desta máquina (tokens, paths) | `~/.zshrc.local` — **não versionado** |
| Nome/email do git | `.chezmoi.toml.tmpl` |

Depois de editar: `chezmoi apply`.

## Comandos que eu uso

```sh
chezmoi edit ~/.zshrc     # edita a fonte, não o arquivo em ~
chezmoi apply             # aplica
chezmoi diff              # vê o que vai mudar antes de aplicar
chezmoi add ~/.config/x   # começa a versionar um arquivo novo
chezmoi re-add            # trouxe pra cá algo que editei direto em ~
chezmoi update            # git pull + apply (em outra máquina)
up                        # topgrade: atualiza apt, flatpak, mise, firmware...
```
