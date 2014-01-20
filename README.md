# Watt

WAT is Watt?  Watt is a shared js/css/img asset library for Artsy Partner Engineering Ruby apps (tested with Rails and with Middleman for static sites).

# On Bootstrap

Ideally, Watt is a very thin layer on top of [Bootstrap](http://getbootstrap.com/) (3.0.3 at the moment). Bootstrap is primarily useful as a series of good defaults; there are many thousands of pretty smart people thinking about reasonable responsive breakpoints--we shouldn't force ourselves to re-invent triangular wheels. Lets be clear about what we are including (Grid &amp; navbar, for example) and lets clearly not include the bits of the framework we choose to not use in production (jumbotron, buttons, modals, carousels, et c).

Watt's relationship to Bootstrap's Javascript and Stylesheet files should follow the same approach here. [_bootstrap_base.css.scss](https://github.com/dylanfareed/watt/blob/with-bootstrap-and-middleman/vendor/assets/stylesheets/watt/_bootstrap_base.css.scss) is be a good example of removing the components we don't presently need.

We'll additioanlly set global variable overrides in [_bootstrap_variables.css.scss](https://github.com/dylanfareed/watt/blob/with-bootstrap-and-middleman/vendor/assets/stylesheets/watt/_bootstrap_variables.css.scss) and, predictably, [_bootstrap_overrides.css.scss.erb](https://github.com/dylanfareed/watt/blob/with-bootstrap-and-middleman/vendor/assets/stylesheets/watt/_bootstrap_overrides.css.scss.erb).

All of three of these files are imported in [base.css.scss](https://github.com/dylanfareed/watt/blob/with-bootstrap-and-middleman/vendor/assets/stylesheets/watt/base.css.scss).


# On Typekit

It would be very surprising if you don't find yourself needing, Garamond from [Typekit](http://typekit.com/). Make sure to include it in the head of your layout file. There is a specific Partner Engineering kit on Artsy's Typekit account. It ought to work in most development setups (localhost) and in production on heroku, aws domains and *.artsy.net.

Something like this should the trick (haml):

```
  :javascript
      //<![CDATA[
        (function() {
          var config = {
            kitId: 'lep8qgg',
            scriptTimeout: 3000
          };
          var h=document.getElementsByTagName("html")[0];h.className+=" wf-loading";var t=setTimeout(function(){h.className=h.className.replace(/(\s|^)wf-loading(\s|$)/g," ");h.className+=" wf-inactive"},config.scriptTimeout);var tk=document.createElement("script"),d=false;tk.src='//use.typekit.net/'+config.kitId+'.js';tk.type="text/javascript";tk.async="true";tk.onload=tk.onreadystatechange=function(){var a=this.readyState;if(d||a&&a!="complete"&&a!="loaded")return;d=true;clearTimeout(t);try{Typekit.load(config)}catch(b){}};var s=document.getElementsByTagName("script")[0];s.parentNode.insertBefore(tk,s)
        })();
      //]]>
```

## Style guide

Watt includes a static style guide, generated by [Middleman](http://middlemanapp.com/). Its accessible on the web at [http://partner-engineering-style-guide.s3-website-us-east-1.amazonaws.com/](http://partner-engineering-style-guide.s3-website-us-east-1.amazonaws.com/).

It is basically split into two sections:

* Interface - the UI in practice; find for example [a sample list of items here](http://partner-engineering-style-guide.s3-website-us-east-1.amazonaws.com/interface/items/)
* Elements - the things broken down into components; find for example [a rundown of button styles here](http://partner-engineering-style-guide.s3-website-us-east-1.amazonaws.com/elements/buttons/)

TODO: More of a walkthrough in terms of how we update the style guide.

```middleman server```

```middleman build```

```AWS_SECRET= AWS_ACCESS_KEY= middleman s3_sync```


## Installation

Watt is a private gem and hosted on Github. To include Watt, add this line to your application's Gemfile, substituting ```USRNME:PSSWRD``` for the proper credentials:

    gem 'artsy-watt', git: 'https://USRNME:PSSWRD@github.com/artsy/watt.git'

And then execute:

    $ bundle

## Usage

TODO: More about usage and how to setup a new project with Watt.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
