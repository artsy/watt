# Watt

Watt is a shared js/css/img asset library for some Artsy ruby apps.

Meta
---

* __State:__ production (in [Volt](https://github.com/artsy/volt/), [Ohm](https://github.com/artsy/ohm/), [Induction](https://github.com/artsy/induction/), [Lattice](https://github.com/artsy/lattice/), [Helix](https://github.com/artsy/helix/), & [Vibrations](https://github.com/artsy/vibrations/))
* __Style Guide:__ [http://partner-engineering-style-guide.s3-website-us-east-1.amazonaws.com/](http://partner-engineering-style-guide.s3-website-us-east-1.amazonaws.com/)
* __Github:__ [https://github.com/artsy/watt/](https://github.com/artsy/watt/)
* __CI:__ [Semaphore](https://semaphoreapp.com/artsy/watt/) (such as it is)
* __Point People:__ [@oxaudo](https://github.com/oxaudo), [@gib](https://github.com/gib)

# On Bootstrap

Ideally, Watt is a very thin layer on top of [Bootstrap](http://getbootstrap.com/) (3.0.3 at the moment). Bootstrap is primarily useful as a series of good defaults; there are many thousands of pretty smart people thinking about reasonable responsive breakpoints--we shouldn't force ourselves to re-invent triangular wheels. Let's be clear about what we are including (Grid &amp; navbar, for example) and lets clearly not include the bits of the framework we choose to not use in production (jumbotron, buttons, modals, carousels, et c).

Watt's relationship to Bootstrap's Javascript and Stylesheet files should follow the same approach here. [_bootstrap_base.css.scss](https://github.com/dylanfareed/watt/blob/with-bootstrap-and-middleman/vendor/assets/stylesheets/watt/_bootstrap_base.css.scss) is be a good example of removing the components we don't presently need.

We'll additioanlly set global variable overrides in [_bootstrap_variables.css.scss](https://github.com/dylanfareed/watt/blob/with-bootstrap-and-middleman/vendor/assets/stylesheets/watt/_bootstrap_variables.css.scss) and, predictably, [_bootstrap_overrides.css.scss.erb](https://github.com/dylanfareed/watt/blob/with-bootstrap-and-middleman/vendor/assets/stylesheets/watt/_bootstrap_overrides.css.scss.erb).

All of three of these files are imported in [base.css.scss](https://github.com/dylanfareed/watt/blob/with-bootstrap-and-middleman/vendor/assets/stylesheets/watt/base.css.scss).

### Bootstrap Variables
It's often useful to reference global variables used by Bootstrap. [This file is the LESS flavor](https://github.com/twbs/bootstrap/blob/master/less/variables.less), but the same variable names are [overwritten by `bootstrap-sass`](https://github.com/twbs/bootstrap-sass/blob/master/vendor/assets/stylesheets/bootstrap/_variables.scss).


# On Bourbon

[Bourbon](http://bourbon.io/) is a [Thoughbot](http://thoughtbot.com/) [joint](https://github.com/thoughtbot).
Bourbon is a library of SASS mixins that are authored solely with SASS. Unlike say, Compass, including Bourbon
does not add complexity to asset compilation, or major weight to a project.


# Fonts

## Fonts.com (Avant Garde & Garamond)

It would be very surprising if you don't find yourself needing, Avant Garde &/or Garamond from Fonts.com. We are using the "Art.sy" kit in the admin@artsymail.com account (password in 1password).

Make sure to include the following in the head of your layout file. It ought to work in most development setups (localhost for Rails and 0.0.0.0 for middleman) and in production on *.artsy.net domains.

Something like this should do the trick (haml):

```
- unless Rails.env == 'test'
  = javascript_include_tag "https://fast.fonts.net/jsapi/f7f47a40-b25b-44ee-9f9c-cfdfc8bb2741.js"
```

Note that we shouldn't include the asset in Test mode for fear of incurring extra costs.

## Icon Font

Like artsy.net projects, we host our own font for icons. This gives us vector graphics for sharp scaling
and allows us to use CSS for colors and transitions just like any other typeface.
See the [Joule](https://github.com/artsy/joule) project for more details.


## Style guide

Watt includes a static style guide, generated by [Middleman](http://middlemanapp.com/). Its accessible on the web at [http://partner-engineering-style-guide.s3-website-us-east-1.amazonaws.com/](http://partner-engineering-style-guide.s3-website-us-east-1.amazonaws.com/).

It is basically split into two sections:

* Interface - the UI in practice; find for example [a sample list of items here](http://partner-engineering-style-guide.s3-website-us-east-1.amazonaws.com/interface/items/)
* Elements - the things broken down into components; find for example [a rundown of button styles here](http://partner-engineering-style-guide.s3-website-us-east-1.amazonaws.com/elements/buttons/)

PRs merged to artsy/watt#master are automatically deployed to the ```partner-engineering-style-guide``` S3 bucket by [Semaphore](https://semaphoreapp.com/artsy/watt).

## Installation

Watt is a private gem and hosted on Github. To include Watt, add this line to your application's Gemfile, substituting ```USRNME:PSSWRD``` for the proper credentials:

    gem 'watt', git: 'https://USRNME:PSSWRD@github.com/artsy/watt.git'

And then execute:

    $ bundle

## Developing Locally With Middleman

Run `middleman` to see your Watt changes locally:
```
cd style-guide
bundle exec middleman server
```

## Usage

TODO: More about usage and how to setup a new project with Watt.

## Authoring Styles

Watt's goal is to maximize re-use of common UI components. To do this, we follow some core tenets.
See this excellent write up by Phillip Walton on
[CSS Architecture](http://philipwalton.com/articles/css-architecture/). While we don't expect to
be too rigid on the naming-schemes presented here, asking ourselves how we measure against the
following goals when adding CSS to Watt is a great start:

- Predictable
- Reusable
- Maintainable
- Scalable

**Alphabetical ordering of style definition rules.** It's consistent and helps in quickly parsing
what's included in a style.

```scss
.chevron-list-link {

}
```

**Namespacing instead of nesting for components.** There is a lengthy class name cost associated with this, but
the benefit balance of maintainance and reuse tips the scales.
May be my favorite CSS metaphor of all time: Grenande vs Sniper Rifle:

```css
/* Grenade */
#main-nav ul li ul { }

/* Sniper Rifle */
.subnav { }

/**
 * Extend components with modifier class names (extend the namespace)
 */
/* Bad */
.widget { }
#sidebar .widget { }

/* Good */
.widget { }
.widget-sidebar { }
```
(From [CSS Architecture](http://philipwalton.com/articles/css-architecture/) by Pillip Walton)


```css
.chevron-list {
  ...
}
.chevron-list-link {
  ...
  &::after {
    ...
  }
}
.chevron-list-link-label {
  ...
}
.chevron-list-link-body {
  ...
}
```

Also note that tags are not included (again [CSS Architecture](http://philipwalton.com/articles/css-architecture/) by Pillip Walton) for wins on reuse and maintenance. This scales as the component does not rely on specific parents:


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
