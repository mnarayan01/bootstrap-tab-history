Bootstrap Tab History
=====================

Integrates [HTML5 history state tracking](https://developer.mozilla.org/en-US/docs/Web/Guide/API/DOM/Manipulating_the_browser_history)
with [`bootstrap/tab.js`](http://getbootstrap.com/javascript/#tabs). This enables users to use `history.forward`,
`history.back` and `location.reload` when navigating between tabs, as well as bookmarking specific tabs.

To enable tracking on a tab element, simply set the `data-tab-history` attribute to `true` (or a string denoting a tab
grouping).

Visit our [GitHub Page](http://mnarayan01.github.io/bootstrap-tab-history/) to see it in action.

Installation
------------

### With Rails >= 3.1

Add `bootstrap-tab-history-rails` to the Gemfile:

```ruby
gem 'bootstrap-tab-history-rails'
```

and then add the following line to `app/assets/javascripts/application.js`:

```javascript
//= require bootstrap-tab-history
```

### Without Rails

Add [`bootstrap-tab-history.js`](vendor/assets/javascripts/bootstrap-tab-history.js) to your JavaScripts.

Configuration
-------------

### Element options

Individual elements are configured by setting the following data attributes:

*   `data-tab-history` - Required. Set to `true` to enable tracking on a tab. Can also be set to an arbitrary string
    value to support pages with multiple tab groups.
*   `data-tab-history-anchor-y-offset` - When the anchor portion of the URI is used to activate a tab, scroll down to
    the given offset, rather than the element with the given `id` attribute. Set to null to disable. Only relevant if
    `BootstrapTabHistory.options.showTabsBasedOnAnchor` is true.
*   `data-tab-history-changer`
    *   'push' - Use [`history.pushState`](https://developer.mozilla.org/en-US/docs/Web/Guide/API/DOM/Manipulating_the_browser_history#The_pushState%28%29.C2.A0method)
        to update `history.state`. This will allow the use of `history.forward` and `history.back` as users switch
        tabs.
    *   'replace' - Use [`history.replaceState`](https://developer.mozilla.org/en-US/docs/Web/Guide/API/DOM/Manipulating_the_browser_history#The_replaceState%28%29.C2.A0method)
        to update `history.state`. This will leave users on the same page w.r.t. `history.forward` and `history.back` as
        they switch tabs.
*   `data-tab-history-update-url` - If `true`, update the URL in the calls to `history.pushState` and
    `history.replaceState`. When `false`, `null` is passed as the third parameter to these calls.

For data attributes which are interpreted as "truthy" values (i.e. `data-tab-history` and
`data-tab-history-update-url`), an empty string is treated as equivalent to `true`.

### Global options

```javascript
BootstrapTabHistory.options = {
  // Default value corresponding to the `data-tab-history-anchor-y-offset` attribute.
  defaultAnchorYOffset: 0,

  // Default value corresponding to the `data-tab-history-changer` attribute.
  defaultChanger: 'replace',

  // Default value corresponding to the `data-tab-history-update-url` attribute.
  defaultUpdateURL: false,

  // Should the anchor portion of the loaded URI be used to activate a single tab if no history was
  // present on page load.
  showTabsBasedOnAnchor: true
};
```

### Example

An extremely simple example can be found at [`data/example.html`](data/example.html), with the relevant portion
duplicated below.

```html
<ul class="nav nav-tabs">
  <li class="active">
    <a  href="#1-1"
        data-toggle="tab"
        data-tab-history="true"
        data-tab-history-changer="push"
        data-tab-history-update-url="true">
      Tab 1:1
    </a>
  </li>
  <li>
    <a  href="#1-2"
        data-toggle="tab"
        data-tab-history="true"
        data-tab-history-changer="push"
        data-tab-history-update-url="true">
      Tab 1:2
    </a>
  </li>
</ul>
<div class="tab-content">
  <div class="tab-pane active" id="1-1">
    Sample content for Tab 1:1.
  </div>
  <div class="tab-pane" id="1-2">
    Sample content for Tab 1:2.
  </div>
</div>
```
