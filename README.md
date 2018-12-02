# Multi search for language learning
Simple web-page that allows you to search for a word in your target language and find images, definitions, and more.

## For Contributors

The site in generated using [Jekyll](https://jekyllrb.com/) so we can take advantage of GitHub Pages' built in support for it.  If you haven't worked with Jekyll before please read the [step-by-step guide](https://jekyllrb.com/docs/step-by-step/01-setup/) to bring you up to speed before you jump in.

The site is generated from the files in `_data/languages`.  

To add a language, you need to do 2 things...

* Add a template at `html/<language>.html`
* Define the resources available in `_data/languages/<language>.yaml`

The easiest way to do that is to copy one of the other languages and modify it to your needs.

#### Data Format

The definition files in `_data/languages` have the following keys.

|Key|Data|Function|
|---|---|---|
|`name`|e.g. Spanish|Title cased name of the language - must be consistent with `html/<language>.html`|
|`extra_user_info`|String|Shows on the index page if defined (e.g. see English)|
|`enabled`|`true/false`|Set to false to hide the language on the homepage|
|`resources`|`[array...]`|Array of resources available for the languages|

Note that the resources `js_url_expression` field is a JavaScript expression that is directly spliced into a `window.open("<url>")` command.

#### Future Proofing

:warning: It's early days so much of this is subject to change

🤘 It's early days so there's plenty of scope to make this better
