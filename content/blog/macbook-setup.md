---
title: 개인적인 맥북 세팅법
date: 2020-04-26T18:30:46+06:00
draft: false

#post thumb
image: #"images/featured-post/post-1.jpg"

# meta description
description: "this is meta description"
math: true

# taxonomies
categories:
  - "Living"
tags:
  - "Macbook"

# post type
type: "post"
---

# After MacOS Install

## 1. Install applications

- Kakao Talk
- Between
- Snap
    - Add Terminal shortcut
- Speedtest
- Magnet
- MenuBar Stats
    - Add MenuBar Stats Plugins Manager
    - [https://www.seense.com/menubarstats/plugins3/](https://www.seense.com/menubarstats/plugins3/)
- Buddy for Youtube
- Bandizip
    - [https://kr.bandisoft.com/bandizip/x/](https://kr.bandisoft.com/bandizip/x/)
- Notion
    - [https://www.notion.so/desktop](https://www.notion.so/desktop)

## 2. Install brew

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

## 3. Install oh-my-zsh

```bash
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

## 4. Install pyenv

[Python Installation for mac](https://jjerry-k.github.io/python/2018/09/27/python4mac/)

## 5. Edit .zshrc

```bash
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/jerry/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="jreese"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set pyenv
export PYENV_ROOT="${HOME}/.pyenv"
export PATH="${PYENV_ROOT}bin:$PATH"
eval "$(pyenv init -)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/jerry/.pyenv/versions/miniconda3-latest/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/jerry/.pyenv/versions/miniconda3-latest/etc/profile.d/conda.sh" ]; then
        . "/Users/jerry/.pyenv/versions/miniconda3-latest/etc/profile.d/conda.sh"
    else
        export PATH="/Users/jerry/.pyenv/versions/miniconda3-latest/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
```

## 6. Create conda environment

```bash
#!/bin/bash

conda install -y ipykernel jupyter jupyterlab pylint
conda update --all -y
conda create -y -n tf python=3.7
conda create -y -n tc python=3.7

source ~/.pyenv/versions/miniconda3-latest/etc/profile.d/conda.sh

# Create TensorFlow Environment
conda activate tf
conda install -y numpy scipy pandas matplotlib pylint
conda install -y seaborn pillow scikit-image opencv scikit-learn tqdm ipython ipykernel ipywidgets
conda install -y tensorflow
conda update --all -y
python -m ipykernel install --user --name tf --display-name TensorFlow
conda deactivate

# Create PyTorch Environment
conda activate tc
conda install -y numpy scipy pandas matplotlib pylint
conda install -y seaborn pillow scikit-image opencv scikit-learn tqdm ipython ipykernel ipywidgets
conda install -y -c pytorch pytorch torchvision
conda update --all -y
python -m ipykernel install --user --name tc --display-name PyTorch
conda deactivate
```

## 7. Install VSCode

- [https://code.visualstudio.com/docs/?dv=osx](https://code.visualstudio.com/docs/?dv=osx)
- Install plugin
    - python
    - pylance
    - Rainbow Brackets
    - indent-rainbow
    - Remote - SSH
    - kite
        - [https://kite.com/download/](https://kite.com/download/)
    - c/c++
    - markdown-all-in-one
    - leetcode
        - brew install node
        - Sign in using github