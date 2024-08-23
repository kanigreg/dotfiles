vim.filetype.add({
  extension = {
    d2 = 'd2',
    jbuilder = 'ruby',
    excalidraw = 'json'
  },
  pattern = {
    ['*/playbooks/*.yaml'] = 'yaml.ansible',
    ['*/playbooks/*.yml'] = 'yaml.ansible'
  }
})
