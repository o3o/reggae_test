#https://github.com/dlang-community/stdx-allocator/blob/master/meson.build
project('animal', 'd',
  version: '0.1.0'
)

project_soversion = 0
animal_src = [
  'src/animal/cat.d', 'src/animal/dog.d'
]

src_dir = include_directories('src/')
# animal_lib = static_library('animal',
#     [animal_src],
# 	 include_directories: [src_dir],
#     install: true,
#     version: meson.project_version(),
#     soversion: project_soversion
#     #d_module_versions: ['FeatureA', 'featureB']
# )


animal_lib = static_library('animal',
    [animal_src],
	 include_directories: [src_dir],
    install: true
)

# for embed this as subproject
animal_dep = declare_dependency(
    link_with: animal_lib,
    include_directories: src_dir
)

#
# install
#
install_subdir('src/animal/', install_dir: 'include/d/animal/')

pkgc = import('pkgconfig')

pkgc.generate(name: 'animal',
  libraries: animal_lib,
  subdirs: 'd/' + meson.project_name(),
  version: meson.project_version(),
  description: 'High-level interface for animal'
)
