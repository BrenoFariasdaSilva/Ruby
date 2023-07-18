<div align="center">
  
# [Ruby.](https://github.com/BrenoFariasdaSilva/Ruby) <img src="https://github.com/devicons/devicon/blob/master/icons/ruby/ruby-original.svg"  width="3%" height="3%">

</div>

<div align="center">
  
---

This repo is made with the objective of showing the ruby related codes i have written. \
Feel free to contribute and send suggestions.
  
---

</div>

# Installation:

- Ruby Language:

```bash
sudo apt install ruby -y
```

- RBEnv - Ruby Version Manager (Optional):

```bash
git clone https://github.com/rbenv/rbenv.git ~/.rbenv 
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL
rbenv --version
```

- IRB - Ruby Interactive:

```bash
# Just type irb on your terminal if you want to use ruby without even need to create a file, similar to IPython.
```

- Execute Ruby code
```bash
ruby filename.rb
# Example: ruby main.rb
```

## Text Editor - Visual Studio Code:
```bash
sudo apt update -y
sudo apt install software-properties-common apt-transport-https cd ~/Downloads
wget -y
cd ~/Downloads
wget -O- https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor | sudo tee /usr/share/keyrings/vscode.gpg
echo deb [arch=amd64 signed-by=/usr/share/keyrings/vscode.gpg] https://packages.microsoft.com/repos/vscode stable main | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update -y
sudo apt install code -y
```

## Contributing
Code improvement recommendations are very welcome, but keep in mind that many exercises will be very simple, with a lot of room for improvement, after all here is all the history of my learning progress.

## License
[MIT](https://choosealicense.com/licenses/mit/)
