#Event tracking config for DDC + GTM

### 1. Install GTM and configure data layer like normal

### 2. Add the following script and set firing rules for all pages:

```javascript

(function($){

  var ev = {

    init: function(){
      if (typeof dataLayer === 'undefined') {
        return false;
      }
      if ($('.track-event').length) {
        var node = $('.track-pageview');
        ev.trackEvent(node);
      }
    },

    trackEvent: function(node){
      dataLayer.push({
        'event': 'gaTriggerEvent',
        'gaEventCategory': node.data('category'),
        'gaEventAction': node.data('action'),
        'gaEventLabel': node.data('label')
      });
    }

  };

  $(document).ready(ev.init);

})(jQuery);


```

## Configuration

Replace anything in `[]` with variable data. Example `[NEW OR USED]` --> `'NEW'` . These variable values are not strictly necessary, but useful to have. If there is not an easy way to set them, you may omit.

### 3. Add to Thank You page

```html
<input type='hidden' class='track-event' data-category='Lead Form Submissions' data-action='[FORM NAME]'/>
```

### 4. Add to SRP
```html
<input type='hidden' class='track-event' data-category='Search Results Page View'/>
```

### 5. Add to VDP
```html
<input type='hidden' class='track-event' data-category='VDP View' data-label='[NEW OR USED]'/>
```

### 6. Verify in GA live event view
