## GA Event Tracking

### Script
```
(function($){

  var ev = {

    init: function(){
      if (typeof dataLayer === 'undefined') {
        return false;
      }
      $('.track-click').click(function(e){
        ev.trackEvent($(this));
      });
      if ($('.track-pageview').length) {
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
### Implementation

#### Click Tracking

Tag any submit button with class .track-click and then add the appropriate data elements.

- Coupon Submit:
```
  data-action='coupon'
  data-category='Lead Form Submissions'
  data-label='[couponType]'
```

- Text Vehicle Submit:
```
  data-category='Text Me Car Form Submissions'
```

- Any Click to Call:
```
  data-action='[phone number type (sales,service etc)]'
  data-category='Click to Call'
```

- Vehicle Specific Form:
```
  data-action='[form-name]'
  data-category='Lead Form Submissions'
  data-label='[vehicle year make model]'
```

- Non-specific form:
```
  data-action='[form-name]'
  data-category='Lead Form Submissions'
```

#### Page View Tracking:

Create a hidden input on the page you want to track with class .track-pageview then add the appropriate data elements to it.

- Hours and Directions:
```
  data-category='Hours and Directions'
  data-action='Hours and Directions'
  data-label='Hours and Directions'
```

- SRP:
```
  data-category='Search Results Page View'
```

- VDP:
```
  data-category='VDP Views [new or used] Inventory'
  data-action='[vehicle make model]'
  data-label='[year make model submodel/trim]'
```
