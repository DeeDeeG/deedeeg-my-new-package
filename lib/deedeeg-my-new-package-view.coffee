module.exports =
class DeedeegMyNewPackageView
  constructor: (serializedState) ->
    # Create root element
    @element = document.createElement('div')
    @element.classList.add('deedeeg-my-new-package')

    # Create message element
    message = document.createElement('div')
    message.textContent = "The DeedeegMyNewPackage package is Alive! It's ALIVE!"
    message.classList.add('message')
    @element.appendChild(message)

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element
