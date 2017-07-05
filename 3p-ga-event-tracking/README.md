# Event tracking config for 3rd Party Websites + GTM

### 1. Install GTM and configure data layer like normal

### 2. Add the following script and set firing rules for all pages:

```html
<script>
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

</script>
```

## Configuration

### 1. Add to Thank You page

```html
<input type='hidden' class='track-event' data-type='lead' data-category='Lead Form Submissions'/>
```

### 2. Add to SRP
```html
<input type='hidden' class='track-event' data-category='Search Results Page View'/>
```

### 3. Add to VDP
```html
<input type='hidden' class='track-event' data-type='vdp' data-category='VDP View'/>
```

### 4. Publish & Verify in GA live event view
