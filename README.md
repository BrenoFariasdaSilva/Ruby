# Ruby
This repo is made with the objective of showing the ruby related codes i have written.
Feel free to contribute and send suggestions.

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
```