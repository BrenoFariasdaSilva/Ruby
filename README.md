<div align="center">
  
# [Ruby.](https://github.com/BrenoFariasdaSilva/Ruby) <img src="https://github.com/devicons/devicon/blob/master/icons/ruby/ruby-original.svg"  width="3%" height="3%">

</div>

<div align="center">
  
---

This repo is made with the objective of showing the ruby related codes i have written. \
Feel free to contribute and send suggestions.
  
---

</div>

<div align="center">

![GitHub Code Size in Bytes](https://img.shields.io/github/languages/code-size/BrenoFariasdaSilva/Ruby)
![GitHub Last Commit](https://img.shields.io/github/last-commit/BrenoFariasdaSilva/Ruby)
![GitHub](https://img.shields.io/github/license/BrenoFariasdaSilva/Ruby)
![wakatime](https://wakatime.com/badge/github/BrenoFariasdaSilva/Ruby.svg)

</div>

<div align="center">

![GitHub Code Size in Bytes](https://img.shields.io/github/languages/code-size/BrenoFariasdaSilva/Ruby)
![GitHub Last Commit](https://img.shields.io/github/last-commit/BrenoFariasdaSilva/Ruby)
![GitHub License](https://img.shields.io/github/license/BrenoFariasdaSilva/Ruby)
![wakatime](https://wakatime.com/badge/github/BrenoFariasdaSilva/Ruby.svg)
[![GitHub Commits](https://img.shields.io/github/commit-activity/t/BrenoFariasdaSilva/Ruby/main)](https://github.com/BrenoFariasdaSilva/Ruby/commits/main)
[![GitHub Forks](https://img.shields.io/github/forks/BrenoFariasdaSilva/Ruby)](https://github.com/BrenoFariasdaSilva/Ruby/network/members)
![GitHub Language Count](https://img.shields.io/github/languages/count/BrenoFariasdaSilva/Ruby)
[![GitHub Stars](https://img.shields.io/github/stars/BrenoFariasdaSilva/Ruby)](https://github.com/BrenoFariasdaSilva/Ruby/stargazers)
[![GitHub Contributors](https://img.shields.io/github/contributors/BrenoFariasdaSilva/Ruby)](https://github.com/BrenoFariasdaSilva/Ruby/graphs/contributors)
[![GitHub Created At](https://img.shields.io/github/created-at/BrenoFariasdaSilva/Ruby)](https://github.com/BrenoFariasdaSilva/Ruby)
[![GitHub Repository Size](https://img.shields.io/github/repo-size/BrenoFariasdaSilva/Ruby)](https://github.com/BrenoFariasdaSilva/Ruby)
[![Open Issues](https://img.shields.io/github/issues/BrenoFariasdaSilva/Ruby)](https://github.com/BrenoFariasdaSilva/Ruby/issues)
[![Closed Issues](https://img.shields.io/github/issues-closed/BrenoFariasdaSilva/Ruby)](https://github.com/BrenoFariasdaSilva/Ruby/issues?q=is%3Aissue+is%3Aclosed)
[![Open Pull Requests](https://img.shields.io/github/issues-pr/BrenoFariasdaSilva/Ruby)](https://github.com/BrenoFariasdaSilva/Ruby/pulls)
[![Closed Pull Requests](https://img.shields.io/github/issues-pr-closed/BrenoFariasdaSilva/Ruby)](https://github.com/BrenoFariasdaSilva/Ruby/pulls?q=is%3Apr+is%3Aclosed)
[![Monthly Commits](https://img.shields.io/github/commit-activity/m/BrenoFariasdaSilva/Ruby/main)](https://github.com/BrenoFariasdaSilva/Ruby/commits)
[![Merged PRs](https://img.shields.io/github/issues-search/BrenoFariasdaSilva/Ruby?query=is%3Apr%20is%3Amerged&label=merged%20PRs&color=blue)](https://github.com/BrenoFariasdaSilva/Ruby/pulls?q=is%3Apr+is%3Amerged)
![GitHub Primary Language](https://img.shields.io/badge/language-Ruby-3b82f6)

![Repobeats Statistics](https://repobeats.axiom.co/api/embed/a98bbb82b999fd5f43fdf85f66933058c80bdb61.svg)

</div>


## Table of Contents
- [Ruby. ](#ruby-)
  - [Table of Contents](#table-of-contents)
- [Installation:](#installation)
  - [Text Editor - Visual Studio Code:](#text-editor---visual-studio-code)
  - [Contributing](#contributing)
  - [License](#license)


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

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**. If you have suggestions for improving the code, your insights will be highly welcome.
In order to contribute to this project, please follow the guidelines below or read the [CONTRIBUTING.md](CONTRIBUTING.md) file for more details on how to contribute to this project, as it contains information about the commit standards and the entire pull request process.
Please follow these guidelines to make your contributions smooth and effective:

1. **Set Up Your Environment**: Ensure you've followed the setup instructions in the [Setup](#setup) section to prepare your development environment.

2. **Make Your Changes**:
   - **Create a Branch**: `git checkout -b feature/YourFeatureName`
   - **Implement Your Changes**: Make sure to test your changes thoroughly.
   - **Commit Your Changes**: Use clear commit messages, for example:
     - For new features: `git commit -m "FEAT: Add some AmazingFeature"`
     - For bug fixes: `git commit -m "FIX: Resolve Issue #123"`
     - For documentation: `git commit -m "DOCS: Update README with new instructions"`
     - For refactorings: `git commit -m "REFACTOR: Enhance component for better aspect"`
     - For snapshots: `git commit -m "SNAPSHOT: Temporary commit to save the current state for later reference"`
   - See more about crafting commit messages in the [CONTRIBUTING.md](CONTRIBUTING.md) file.

3. **Submit Your Contribution**:
   - **Push Your Changes**: `git push origin feature/YourFeatureName`
   - **Open a Pull Request (PR)**: Navigate to the repository on GitHub and open a PR with a detailed description of your changes.

4. **Stay Engaged**: Respond to any feedback from the project maintainers and make necessary adjustments to your PR.

5. **Celebrate**: Once your PR is merged, celebrate your contribution to the project!

## License
[MIT](https://choosealicense.com/licenses/mit/)
