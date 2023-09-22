# Redmine Mermaid Macro Plugin

This plugin is a fork of taikii/redmine_mermaid_macro.
This plugin adds a `mermaid` graph macro to wiki formated fields.

About mermaid: https://mermaid.js.org/

## Example

```
{{mermaid
graph TD;
    A-->B;
    A-->C;
    B-->D;
    C-->D;
}}
```

![Example](doc/images/example.png)

## Installation

1. Clone or copy files into the Redmine plugins directory
   ```
   // < v10
   git clone -b mermaid9 https://github.com/taikii/redmine_mermaid_macro.git plugins/redmine_mermaid_macro

   // >= v10
   git clone -b mermaid10 https://github.com/taikii/redmine_mermaid_macro.git plugins/redmine_mermaid_macro
   ```
2. Restart Redmine

## Configration

You can configure `mermaid.js` URL on `Administration -> Plugins` page.
Default value is jsDelivr CDN.
https://cdn.jsdelivr.net/npm/mermaid@10/dist/mermaid.esm.min.mjs

## License

[MIT](LICENSE)
