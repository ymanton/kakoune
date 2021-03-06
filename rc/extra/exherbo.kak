## Repository metadata files
hook global BufCreate .*/metadata/mirrors\.conf         %{ set-option buffer filetype paludis-mirrors-conf }
hook global BufCreate .*/metadata/licence_groups.conf   %{ set-option buffer filetype exheres-0-licence-groups }
hook global BufCreate .*/metadata/options/descriptions/.*\.conf   %{ set-option buffer filetype exheres-0-licence-groups }
hook global BufCreate .*/metadata/.*\.conf              %{ set-option buffer filetype exheres-0-metadata }

## News items
hook global BufCreate .*/metadata/news/.*/.*\.txt %{ set-option buffer filetype glep42 }

## exheres-0, exlib
hook global BufCreate .*\.(exheres-0|exlib) %{ set-option buffer filetype sh }

# Paludis configurations
hook global BufCreate .*/etc/paludis(-.*)?/bashrc                               %{ set-option buffer filetype sh }
hook global BufCreate .*/etc/paludis(-.*)?/general(\.conf.d/.*.conf|\.conf)     %{ set-option buffer filetype paludis-key-value-conf }
hook global BufCreate .*/etc/paludis(-.*)?/licences(\.conf.d/.*.conf|\.conf)    %{ set-option buffer filetype paludis-options-conf }
hook global BufCreate .*/etc/paludis(-.*)?/mirrors(\.conf.d/.*.conf|\.conf)     %{ set-option buffer filetype paludis-mirrors-conf }
hook global BufCreate .*/etc/paludis(-.*)?/options(\.conf.d/.*.conf|\.conf)     %{ set-option buffer filetype paludis-options-conf }
hook global BufCreate .*/etc/paludis(-.*)?/output(\.conf.d/.*.conf|\.conf)      %{ set-option buffer filetype paludis-key-value-conf }
hook global BufCreate .*/etc/paludis(-.*)?/package_(unmask|mask)(\.conf.d/.*.conf|\.conf)     %{ set-option buffer filetype paludis-specs-conf }
hook global BufCreate .*/etc/paludis(-.*)?/platforms(\.conf.d/.*.conf|\.conf)   %{ set-option buffer filetype paludis-specs-conf }
hook global BufCreate .*/etc/paludis(-.*)?/repositories/.*\.conf                %{ set-option buffer filetype paludis-key-value-conf }
hook global BufCreate .*/etc/paludis(-.*)?/repository\.template                 %{ set-option buffer filetype paludis-key-value-conf }
hook global BufCreate .*/etc/paludis(-.*)?/repository_defaults\.conf            %{ set-option buffer filetype paludis-key-value-conf }
hook global BufCreate .*/etc/paludis(-.*)?/specpath\.conf                       %{ set-option buffer filetype paludis-key-value-conf }
hook global BufCreate .*/etc/paludis(-.*)?/suggestions(\.conf.d/.*.conf|\.conf) %{ set-option buffer filetype paludis-specs-conf }

# Highlighters
## exheres-0 Repository metadata files
add-highlighter shared/ group exheres-0-metadata
add-highlighter shared/exheres-0-metadata regex ^#.*?$ 0:comment
add-highlighter shared/exheres-0-metadata regex ^(?:[\s\t]+)?(\*)?(\S+)(?:[\s\t]+)?=(?:[\s\t]+)?(.+?)?$ 1:type 2:attribute 3:string
add-highlighter shared/exheres-0-metadata regex ^(?:[\s\t]+)?[\S]+[\s\t]+=[\s\t]+\[.+?[\s\t]+\] 0:string
add-highlighter shared/exheres-0-metadata regex ^(?:[\s\t]+)?(\S+)\s\[\[$ 0:type
add-highlighter shared/exheres-0-metadata regex ^(?:[\s\t]+)?\]\]$ 0:type

hook -group exheres-0-metadata-highlight global WinSetOption filetype=exheres-0-metadata %{ add-highlighter window ref exheres-0-metadata }
hook -group exheres-0-metadata-highlight global WinSetOption filetype=(?!exheres-0-metadata).* %{ remove-highlighter window/exheres-0-metadata }

## exheres-0 options descriptions
add-highlighter shared/ group exheres-0-options-descriptions
add-highlighter shared/exheres-0-options-descriptions regex ^#.*?$ 0:comment
add-highlighter shared/exheres-0-options-descriptions regex ^(?:[\s\t]+)?[\S]+[\s\t]+-[\s\t]+\[.+?[\s\t]+\] 0:string
add-highlighter shared/exheres-0-options-descriptions regex ^(?:[\s\t]+)?(\S+)\s\[\[$ 0:type
add-highlighter shared/exheres-0-options-descriptions regex ^(?:[\s\t]+)?\]\]$ 0:type

hook -group exheres-0-options-descriptions-highlight global WinSetOption filetype=exheres-0-options-descriptions %{ add-highlighter window ref exheres-0-options-descriptions }
hook -group exheres-0-options-descriptions-highlight global WinSetOption filetype=(?!exheres-0-options-descriptions).* %{ remove-highlighter window/exheres-0-options-descriptions }

## metadata/licence_groups.conf
add-highlighter shared/ group exheres-0-licence-groups
add-highlighter shared/exheres-0-licence-groups regex [\s\t]+(\S+(?:[\s\t]+))*$ 0:attribute
add-highlighter shared/exheres-0-licence-groups regex ^(\S+) 0:type
add-highlighter shared/exheres-0-licence-groups regex ^#.*?$ 0:comment

hook -group exheres-0-licence-groups-highlight global WinSetOption filetype=exheres-0-licence-groups %{ add-highlighter window ref exheres-0-licence-groups }
hook -group exheres-0-licence-groups-highlight global WinSetOption filetype=(?!exheres-0-licence-groups).* %{ remove-highlighter window/exheres-0-licence-groups }

## Paludis configurations
### options.conf
add-highlighter shared/ group paludis-options-conf
add-highlighter shared/paludis-options-conf regex [\s\t]+(\S+(?:[\s\t]+))*$ 0:attribute
add-highlighter shared/paludis-options-conf regex (?::)(?:[\s\t]+)(.*?$) 1:attribute
add-highlighter shared/paludis-options-conf regex [\s\t]+(\S+=)(\S+) 1:attribute 2:value
add-highlighter shared/paludis-options-conf regex [\s\t](\S+:) 0:keyword
add-highlighter shared/paludis-options-conf regex [\s\t](-\S+)(.*?) 1:red
add-highlighter shared/paludis-options-conf regex ^(\S+/\S+) 0:type
add-highlighter shared/paludis-options-conf regex ^#.*?$ 0:comment

hook -group paludis-options-conf-highlight global WinSetOption filetype=paludis-options-conf %{ add-highlighter window ref paludis-options-conf }
hook -group paludis-options-conf-highlight global WinSetOption filetype=(?!paludis-options-conf).* %{ remove-highlighter window/paludis-options-conf }

## general.conf, repository.template
add-highlighter shared/ group paludis-key-value-conf
add-highlighter shared/paludis-key-value-conf regex ^[\s\t]?(\S+)[\s\t+]=[\s\t+](.*?)$ 1:attribute 2:value
add-highlighter shared/paludis-key-value-conf regex ^#.*?$ 0:comment

hook -group paludis-key-value-conf-highlight global WinSetOption filetype=paludis-key-value-conf %{ add-highlighter window ref paludis-key-value-conf }
hook -group paludis-key-value-conf-highlight global WinSetOption filetype=(?!paludis-key-value-conf).* %{ remove-highlighter window/paludis-key-value-conf }

## mirrors.conf
add-highlighter shared/ group paludis-mirrors-conf
add-highlighter shared/paludis-mirrors-conf regex ^[\s\t+]?(\S+)[\s\t+](.*?)$ 1:type 2:value
add-highlighter shared/paludis-mirrors-conf regex ^#.*?$ 0:comment

hook -group paludis-mirrors-conf-highlight global WinSetOption filetype=paludis-mirrors-conf %{ add-highlighter window ref paludis-mirrors-conf }
hook -group paludis-mirrors-conf-highlight global WinSetOption filetype=(?!paludis-mirrors-conf).* %{ remove-highlighter window/paludis-mirrors-conf }

## package_(unmask|mask).conf, platforms.conf
add-highlighter shared/ group paludis-specs-conf
add-highlighter shared/paludis-specs-conf regex [\s\t]+(\S+(?:[\s\t]+))*$ 0:attribute
add-highlighter shared/paludis-specs-conf regex ^(\S+/\S+) 0:type
add-highlighter shared/paludis-specs-conf regex ^#.*?$ 0:comment

hook -group paludis-specs-conf-highlight global WinSetOption filetype=paludis-specs-conf %{ add-highlighter window ref paludis-specs-conf }
hook -group paludis-specs-conf-highlight global WinSetOption filetype=(?!paludis-specs-conf).* %{ remove-highlighter window/paludis-specs-conf }

## News items (GLEP42)
add-highlighter shared/ group glep42
add-highlighter shared/glep42 regex ^(Title|Author|Translator|Content-Type|Posted|Revision|News-Item-Format|Display-If-Installed|Display-If-Keyword|Display-If-Profile):([^\n]*(?:\n\h+[^\n]+)*)$ 1:keyword 2:attribute
add-highlighter shared/glep42 regex <[^@>]+@.*?> 0:string
add-highlighter shared/glep42 regex ^>.*?$ 0:comment

hook -group glep42-highlight global WinSetOption filetype=glep42 %{ add-highlighter window ref glep42 }
hook -group glep42-highlight global WinSetOption filetype=(?!glep42).* %{ remove-highlighter window/glep42 }
