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
        var node = $('.track-event');
        ev.trackEvent(node);
      }
    },

    trackEvent: function(node){

      var action = node.data('action');

      if(node.data('type')==='lead'){
        action = ev.getParamVal('formId');
      }

      if(node.data('type')==='vdp'){

        if window.location.href.includes('new'){
          action = 'VDP View New Inventory';
        }else{
          action = 'VDP View Used Inventory';
        }

      }

      dataLayer.push({
        'event': 'gaTriggerEvent',
        'gaEventCategory': node.data('category'),
        'gaEventAction': action,
        'gaEventLabel': node.data('label')
      });
    },

    getParamVal: function(param){
      url = window.location.href;
      name = name.replace(/[\[\]]/g, "\\$&");
      var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
          results = regex.exec(url);
      if (!results) return null;
      if (!results[2]) return '';
      return decodeURIComponent(results[2].replace(/\+/g, " "));
    }

  };

  $(document).ready(ev.init);

})(jQuery);


```

## Configuration

Replace anything in `[]` with variable data. Example `[NEW OR USED]` --> `'NEW'` . These variable values are not strictly necessary, but useful to have. If there is not an easy way to set them, you may omit.

### 3. Add to Thank You page

```html
<input type='hidden' class='track-event' data-type='lead' data-category='Lead Form Submissions'/>
```

### 4. Add to SRP
```html
<input type='hidden' class='track-event' data-category='Search Results Page View'/>
```

### 5. Add to VDP
```html
<input type='hidden' class='track-event' data-type='vdp' data-category='VDP View'/>
```

### 6. Verify in GA live event view
