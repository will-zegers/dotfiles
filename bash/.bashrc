function load-zsh ()
{
    (apt list --installed 2> /dev/null | grep zsh) || (sudo apt update && sudo apt -y install zsh)

    chsh -s $(which zsh)
    exec zsh
}
