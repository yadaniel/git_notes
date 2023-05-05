# using pretty format

git log --pretty=format:"%Cred %h %Cblue %x09 %an %x09 %Creset %ad %x09
%Cgreen %s"\
git log --pretty=format:"%Cred %h %Cblue %x09 %\<(20) %an %x09 %Creset
%ad %x09 %Cgreen %s"
