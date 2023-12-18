DeedeegMyNewPackageView = require './deedeeg-my-new-package-view'
{CompositeDisposable} = require 'atom'

module.exports = DeedeegMyNewPackage =
  deedeegMyNewPackageView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @deedeegMyNewPackageView = new DeedeegMyNewPackageView(state.deedeegMyNewPackageViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @deedeegMyNewPackageView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'deedeeg-my-new-package:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @deedeegMyNewPackageView.destroy()

  serialize: ->
    deedeegMyNewPackageViewState: @deedeegMyNewPackageView.serialize()

  toggle: ->
    console.log 'DeedeegMyNewPackage was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
