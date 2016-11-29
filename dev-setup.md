##Setting up Rails Dev Environment in MacOSX

### Download editor of your choice

I prefer [atom](https://atom.io/)

If you choose atom make sure to install command line tools:
![command-line-tools](https://cloud.githubusercontent.com/assets/194400/7987327/ba954dce-0ad4-11e5-897a-19ed0f37ff41.png)

This will allow you to launch the editor from your terminal window:

```shell
  atom .                 #(opens folder)
  atom file.js           #(opens file)
  atom                   #(opens editor)
```

### Open terminal

most of what follows should be done in terminal, in spotlight type `terminal`

### Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

This allows you to more easily customize the look and feel of your terminal and includes many useful features such as smarter auto complete and git integration

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

### Install [Homebrew](http://brew.sh/)

Homebrew is a package manager for MacOS

```shell
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Add Homebrews binary path to the front of the $PATH
echo 'export PATH=/usr/local/bin:$PATH' >> ~/.bash_profile
source ~/.bash_profile
```

make sure its installed ok and update

```shell
brew doctor
brew update
```

### Install git and configure github

```shell
brew install git
```

Create an account at [github](https://github.com) if you don't already have one.

Go to your profile [ssh keys](https://github.com/settings/keys) and choose `New SSH Key`

In terminal do the following

```shell
ssh-keygen -t rsa -b 4096 -C "your_email@example.com" #replace with your github account

#Press Enter for default file location
#Press Enter for default passphrase
#Press Enter to confirm default passphrase
```

You will see output that gives the location of your `id_rsa.pub` file. You need to copy the contents of this file to your github key.

```shell
cat /Users/YOURUSER/.ssh/id_rsa.pub

#copy output starting with ssh-rsa and ending with your email address
```

Paste it into github and save. Now let's verify that it works:

```shell
ssh -T git@github.com

# you should get something like this back:

The authenticity of host 'github.com (192.30.252.1)' can't be established.
RSA key fingerprint is 16:27:ac:a5:76:28:2d:36:63:1b:56:4d:eb:df:a6:48.
Are you sure you want to continue connecting (yes/no)?

#type yes

Hi username! You've successfully authenticated, but GitHub does not
provide shell access.

#all good

```

### Install Ruby and RVM

```shell
#disable documentation to speed up install
echo "gem: --no-document" >> ~/.gemrc
```

Install RVM and Rails

```shell
curl -L https://get.rvm.io | bash -s stable --auto-dotfiles --autolibs=enable --rails
```

When it finishes quit terminal and relaunch. Verify that everything installed correctly:

```shell
rvm -v
# should get 1.26.11 or higher

ruby -v
# should get 2.3 or higher

rails -v
# should get 4.2.6 or higher
```

### Install Bundler

```shell
gem install bundler
```

### Install Postgres

```shell
brew install postgresql
brew services start postgresql
```
