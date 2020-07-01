# Identity Number Verifier for Turkish Citizens
[![Gem Version](https://badge.fury.io/rb/tc_kimlik_no_dogrulama.svg)](https://rubygems.org/gems/tc_kimlik_no_dogrulama)
[![License](https://img.shields.io/github/license/tgezginis/tc_kimlik_no_dogrulama.svg)](https://opensource.org/licenses/MIT)

## Installation

Add it to your Gemfile:

```ruby
gem 'tc_kimlik_no_dogrulama'
```

and run on terminal:

    $ bundle

or install the gem on terminal.

    $ gem install tc_kimlik_no_dogrulama

## Usage

```ruby
require 'tc_kimlik_no_dogrulama'

TcKimlikNoDogrulama.verify(18071470110) # true or false
```

 *Thanks to [Murat Çorlu](http://muratcorlu.com/post/python-ile-tc-kimlik-numarasi-dogrulama/) for verification algorithms.*
