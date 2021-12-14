# Front-end Patterns

Here we compile a list of front-end patterns that might be useful in client apps. For each of them, we provide the usage and examples to help you seemlessly include it in your client apps, and also point you to the source files if you want to dig into it.

- [Callback Triggers](#callback-triggers)
- [Remote Animation](#remote-animation)

## Callback Triggers
|||
|----|---|
|**source**|[vendor/assets/javascripts/watt/callback_triggers.js.coffee](../vendor/assets/javascripts/watt/callback_triggers.js.coffee)|

[Front-end callbacks](https://github.com/artsy/kinetic/blob/main/doc/front_end_callbacks.md) are AJAX calls running on the client side to fetch and render part of views after a page loads. It is a useful pattern to reduce the initial page load time.

The callback triggers here in Watt manually clicks all the [UJS links](https://github.com/rails/jquery-ujs) on the page and triggers the following behavior in controllers (usually fetching some data and rendering views). All the UJS links (with `data-remote="true"` and `data-callback="true"`) will be treated as callback links and will be clicked.

#### Usage
Follow the pattern in [front-end callbacks](https://github.com/artsy/kinetic/blob/main/doc/front_end_callbacks.md) and specify `data-remote="true"` and `data-callback="true"` in the UJS links. The callbacks should be automatially triggered after the page loads.

#### Examples
On Volt's welcome page, we render the partner stats via [front-end callbacks](https://github.com/artsy/volt/blob/9f2669bb347bf7b9b3276c34414b3e39ce402f72/app/views/home/_stats_modules.haml#L10). An example looks like this and the callback triggers will click the link for you:

```haml
= link_to '', dashboard_stats_partner_artists_path(callback: true, callback_replace: '.artists-stats-section .artists-stats-data'), remote: true, data: { no_turbolink: true, callback: true }
```

![](images/callback_triggers.gif)

As demonstrated in the screencast, displaying a loading spinner initially and replacing it with fetched content provides a good user experience.

## Remote Animation
|||
|----|---|
|**source**|[vendor/assets/javascripts/watt/remote_animation.js.coffee](../vendor/assets/javascripts/watt/remote_animation.js.coffee)|

We display a loading spinner to indicate a page is in the middle of processing something (e.g. making AJAX calls), and give users good feedback. Typically in Watt's client apps, AJAX calls are triggered by sumitting a form or clicking a link/button marked with `data-remote` attribute, and [UJS](https://github.com/rails/jquery-ujs/wiki/ajax) does the submission and fires custom events behind the scene. We are able to use the events to automatically show the loading spinners while making AJAX calls, i.e. links/buttons marked with `data-remote` attribute will get a loading spinner when they are making AJAX calls.

#### Usage
Make sure the form or link/button has the `data-remote` attribute set, and it should get the loading spinner for free!

```haml
 = simple_form_for :match, :url => artists_url, remote: true, :method => :get do |f|
   //...
```

```haml
= link_to '', partner_shows_url, method: :get, remote: true
```

_Note: If you just want the loading spinner CSS styles, you can use the `is-loading` class defined in [Watt](https://github.com/artsy/watt/blob/78b4fa2e46c70e97a969dd965f457b9125d03707/vendor/assets/stylesheets/watt/_buttons.scss#L59-L60) directly._

#### Example
![](images/remote_animation.gif)
