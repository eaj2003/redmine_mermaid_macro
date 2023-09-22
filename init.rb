require File.expand_path('lib/mermaid_macro_hook', __dir__)

Redmine::Plugin.register :redmine_mermaid_macro do
  name 'Redmine Mermaid Macro plugin'
  author 'EAJ'
  description 'Add mermaid graphs to your wiki. Fork of taikii/redmine_mermaid_macro.'
  version '1.1.0'
  url 'https://github.com/eaj2003/redmine_mermaid_macro'
  author_url 'https://emergency.co.jp'

  settings :default => { 'mermaid_url' => 'https://cdn.jsdelivr.net/npm/mermaid@10/dist/mermaid.esm.min.mjs' },
           :partial => 'settings/redmine_mermaid_macro_settings'

  Redmine::WikiFormatting::Macros.register do
    desc "Add mermaid graphs to your wiki. Example:\n\n" +
         "{{mermaid\n" +
         "graph TD;\n" +
         "    A-->B;\n" +
         "    A-->C;\n" +
         "    B-->D;\n" +
         "    C-->D;\n" +
         "}}"
    macro :mermaid do |obj, args, text|
      divid = "mermaid_" + SecureRandom.urlsafe_base64(8)

      js = ""
      js << "window.mermaid.initialize({ startOnLoad: false });\n"
      js << "window.mermaid.run({querySelector: '##{divid}'});\n"

      out = ''.html_safe
      out << content_tag(:div, text, id: divid, class: 'mermaid')
      out << javascript_tag(js)
      out
    end
  end
end
