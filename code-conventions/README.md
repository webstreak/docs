#WebStreak Code Conventions

## Common
- use spaces instead of tabs
- the unit of indentation is two spaces
- no trailing whitespaces

## Git
- each commit should must have a comment
- the first line should start with a capital letter
- the total line length should be no more than 80 characters
- the body might provide an extra commit message

## Rails
- specify dependency versions in your Gemfile
  - [why?] (http://tenderlovemaking.com/2012/12/18/rails-4-and-your-gemfile.html)

## [Ruby] (https://github.com/styleguide/ruby)

## [Javascript] (https://google-styleguide.googlecode.com/svn/trunk/javascriptguide.xml)

## HTML/HAML/SLIM
- take advantage of light-weight classes and ids

### Example:

#### Wrong

```
div class='class-name'
  img id='my-image'
```

#### Right

```
.class-name
  img#my-img
```

## CSS/SASS/SCSS
###Classes and IDs should have common sense names in the following format

    .this-is-a-reasonable-class-name
    .ThisIsNotOK
    .this_is_also_wrong