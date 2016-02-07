
typo:
	- git status
	- git commit -am "fixing minor typo"
	- git push origin master

commit:
	- git status
	- git commit -a
	- git push origin master 

update:
	- git pull origin master

status:
	- git status


root=menzies#
files=$(shell find $(root) -type f -name '*.md' | grep -v \.git | grep -v '_')
docs=$(files:.md=.docx)



%.docx : %.md
	pandoc -s -S $< -o $@

docxs:  $(docs)

