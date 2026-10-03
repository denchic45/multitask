project = 'threads'
copyright = '2026, Threads Project'
author = 'denchic45'
version = '0.1.0'
release = '0.1.0'

extensions = [
    'sphinx.ext.autodoc',
    'sphinx.ext.viewcode',
    'sphinx.ext.todo',
]

templates_path = ['_templates']
exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store']

language = 'ru'

html_theme = 'alabaster'
pygments_style = 'sphinx'
highlight_language = 'common-lisp'
