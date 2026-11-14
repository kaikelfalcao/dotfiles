# dotfiles

Gerenciados com [chezmoi](https://chezmoi.io). Feito para Ubuntu + GNOME.

## Instalação

Numa máquina nova:

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b ~/.local/bin init --apply kaikelfalcao
```

Ou, com o repositório já clonado: `./install.sh`

## O que é configurado

| Área | Ferramentas |
|---|---|
| Shell | zsh, autosuggestions, syntax-highlighting, completions, fzf-tab |
| Prompt | Starship (preset *bracketed segments*) |
| Linguagens | mise → Go, Node LTS, Python 3.14 |
| CLIs | eza, bat, fd, ripgrep, fzf, zoxide, atuin, lazygit, delta, gh, yq, tldr, jq, btop, fastfetch |
| Atualização | topgrade (`up`) |
| Fontes | JetBrainsMono, FiraCode, CascadiaCode Nerd Fonts |
| GNOME | Tweaks, Extension Manager, Caffeine, Flathub |
| Git | `.gitconfig` com delta e gh como credential helper |

## Uso do dia a dia

```sh
chezmoi edit ~/.zshrc       # editar um arquivo gerenciado
chezmoi apply               # aplicar mudanças
chezmoi add ~/.config/x     # passar a gerenciar um novo arquivo
chezmoi update              # git pull + apply
dotcd                       # ir para este repositório
```

Configurações só desta máquina: `~/.zshrc.local` (não versionado).
