# FreeAgent Coding Challenge

Thank you for your interest in the FreeAgent Coding Challenge.  This template is a barebones guide to get you started.  Please add any gems, folders, files, etc. you see fit in order to produce a solution you're proud of.

## Coding Challenge Instructions

Please see the INSTRUCTIONS.md file for more information.

## Your Solution Setup and Run Instructions

Please include instructions on how to setup and run your solution here.

1. Run the bundle command to install specific gems
```
bundle install
```
2. Run the Rspecs
```
bundle exec rspec spec
```
3. Run Rubocop for code analysis and for any errors in code
```
rubocop
```
Thoughts and Decision :

Taking into consideration future perspective for base currency can be changed and data sources can be anything other than JSON.

1. I created service layer architecture. where File Parser method is in different module and class and can be used for any format of file like json or xml .

2. I have also calculated the currency with base currency and non base currency taking in a point which can changed other than EURO and rspecs are running if we change base currency to USD.

3. I have written the test using RSPEC, as they are very easy to read and figure out what they are trying to verify

4. It also checks code error using rubocop and yard documentation.