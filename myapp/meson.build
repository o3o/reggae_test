project('myapp', 'd', version: '0.2.0')


src_dir = include_directories('src/')
animal_dep = dependency('animal', version: '>=0.1.0', fallback: ['animal', 'animal_dep'])

src = [ 'src/app.d']
executable('myapp',
  sources: src,
  dependencies : animal_dep)
