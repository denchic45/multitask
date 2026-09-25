import os
import sys

project = 'multitask'
copyright = '2026, Multitask Project'
author = 'denchi45'
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
html_static_path = ['_static']

pygments_style = 'sphinx'
highlight_language = 'common-lisp'
