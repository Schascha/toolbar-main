module.exports =

    config:
        'convert-spaces-to-tabs':
            title: 'Enable Convert Spaces to Tabs'
            type: 'boolean'
            default: true

    activate: (state) ->
        require('atom-package-deps').install('tool-bar-main')

    deactivate: ->
        @toolBar?.removeItems()

    serialize: ->

    consumeToolBar: (toolBar) ->
        @toolBar = toolBar 'main-tool-bar'

        @toolBar.addButton
            icon: 'document'
            callback: 'application:new-file'
            tooltip: 'New File'
            iconset: 'ion'
        @toolBar.addButton
            icon: 'folder'
            callback: 'application:open-file'
            tooltip: 'Open...'
            iconset: 'ion'
        @toolBar.addButton
            icon: 'archive'
            callback: 'core:save'
            tooltip: 'Save'
            iconset: 'ion'

        @toolBar.addSpacer()

        @toolBar.addButton
            icon: 'search'
            callback: 'find-and-replace:show'
            tooltip: 'Find in Buffer'
            iconset: 'ion'
        @toolBar.addButton
            icon: 'shuffle'
            callback: 'find-and-replace:show-replace'
            tooltip: 'Replace in Buffer'
            iconset: 'ion'

        @toolBar.addSpacer()

        @toolBar.addButton
            icon: 'social-github'
            callback: 'github:toggle-git-tab'
            tooltip: 'Toggle Git Tab'
            iconset: 'ion'
        @toolBar.addButton
            icon: 'navicon-round'
            callback: 'command-palette:toggle'
            tooltip: 'Toggle Command Palette'
            iconset: 'ion'
        @toolBar.addButton
            icon: 'gear-a'
            callback: 'settings-view:open'
            tooltip: 'Open Settings View'
            iconset: 'ion'

        @toolBar.addSpacer()

        if atom.packages.getLoadedPackage('open-in-sourcetree')
            @toolBar.addButton
                icon: 'sourcetree-plain'
                callback: 'open-in-sourcetree:open'
                tooltip: 'Open in SourceTree'
                iconset: 'devicon'
        if atom.config.get('toolbar-custom.convert-spaces-to-tabs')
            @toolBar.addButton
                icon: 'code-working'
                callback: 'whitespace:convert-spaces-to-tabs'
                tooltip: 'Convert Spaces to Tabs'
                iconset: 'ion'

        if atom.inDevMode()
            @toolBar.addSpacer()

            @toolBar.addButton
                icon: 'refresh'
                callback: 'window:reload'
                tooltip: 'Reload Window'
                iconset: 'ion'
            @toolBar.addButton
                icon: 'terminal'
                callback: ->
                    require('remote').getCurrentWindow().toggleDevTools()
                tooltip: 'Toggle Developer Tools'