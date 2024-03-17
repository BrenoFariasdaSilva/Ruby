all: dependencies run

run:
	clear; ruby ../Text\ File\ Content\ Sorter/main.rb
	time ruby ./main.rb
	ruby ../CSV\ File\ Content\ Sorter/main.rb
	ruby ../CSV\ Sum\ Sizes/main.rb

simple:
	clear; ruby ../Text\ File\ Content\ Sorter/main.rb
	time ruby ./main.rb

dependencies:
	sudo gem install nokogiri ruby-progressbar selenium-webdriver
