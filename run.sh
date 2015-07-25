mkdir slidybuild
cd slidybuild

wget -q -O- https://s3.amazonaws.com/download.fpcomplete.com/ubuntu/fpco.key | sudo apt-key add -
echo 'deb http://download.fpcomplete.com/ubuntu/trusty stable main'|sudo tee /etc/apt/sources.list.d/fpco.list
sudo apt-get update && sudo apt-get install stack -y
# ref.
#   http://qiita.com/tanakh/items/6866d0f570d0547df026
#   http://tune.hateblo.jp/entry/2015/07/13/034148

stakc new

# Lib.hs -> Main.hs
# Rename new-template -> firstApp

stack setup # to install GHC 7.8
stack build
stack ghci
stack runghc app/Main.hs
stack install
export PATH=$HOME/.local/bin:$PATH
firstApp
