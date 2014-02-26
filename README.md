# Exchange

An easy to use Q&A app that allows you to create question and answer pages which are fully editable by the community

Built with BDD powered by MiniTest

## Content Types
 - Question: A question textfield along with community editable answer

## Installation

Simply download the repo and run `bundle install`

Then migrate the database:

`rake db:create && rake:db:migrate`

And pull in dummy data if you want

`rake db:fixtures:load`

Tests are located in the /test/features directory
