# ranger


To copy/move multiple files, just mark them with `Space` then use `dd`/`yy`. If you want to operate on multiple files stored in different directories, you may use `ya`/`da` to add them to the list of files to be copied/moved before pasting them.

(Note that the copy/cut buffers can be used for other operations as well, by using the `%c` macro in your commands. For example, adding files to the cut/copy buffer using `ya`/`da` then using the `:shell -w printf %c | xargs ls` command allows you to delete multiple files in multiple directories. Remember to clear the buffer once you're done using `ud`/`uy`.)


| 按键、描述               | 描述                                                           |
|--------------------------|----------------------------------------------------------------|
| Basic                    |                                                                |
| en                       | nvim<space>                                                    |
| et                       | touch<space>                                                   |
| ed                       | mkcd<space>                                                    |
| ex                       | extract                                                        |
| em                       | compress                                                       |
| <alt-t>                  | toggle flat                                                    |
| <alt-f>                  | fzf select                                                     |
| <alt-/>                  | fd search                                                      |
| <alt-p>                  | prev                                                           |
| <alt-n>                  | next                                                           |
| Q                        | quit all                                                       |
| q                        | quit                                                           |
| r                        | select xdg-open                                                |
| i                        | display file                                                   |
| w                        | task view                                                      |
| S                        | 打开 shell                                                     |
| :、;                     | console                                                        |
| !、 s                    | console shell<space>                                           |
| f                        | console find<space>                                            |
| cd                       | console cd <space>                                             |
| <F2>                     | rename append                                                  |
| <F3>                     | display file                                                   |
| <F4>                     | edit                                                           |
| <F5>                     | copy                                                           |
| <F6>                     | cut                                                            |
| <F7>                     | console mkdir<space>                                           |
| <F8>                     | console delete                                                 |
| Jump around              |                                                                |
| [                        | move parent -1                                                 |
| ]                        | move parent +1                                                 |
| gh                       | cd ~                                                           |
| gr                       | cd /                                                           |
| g.                       | cd ~/.dotfiles                                                 |
| gt                       | cd ~/GitHub                                                    |
| External Programs        |                                                                |
| E                        | edit                                                           |
| du                       | 文件大小                                                       |
| dU                       | 逆序文件大小                                                   |
| yp                       | yank path                                                      |
| yd                       | yank dir                                                       |
| yn                       | yank name                                                      |
| y.                       | yank name without extension                                    |
| Filesystem Operations    |                                                                |
| =                        | chmod                                                          |
| cw                       | rename                                                         |
| a                        | rename append                                                  |
| A                        | rename append with extension                                   |
| I                        | rename start insert                                            |
| pp                       | paste                                                          |
| po                       | paste overwrite                                                |
| pP                       | paste append                                                   |
| pO                       | paste overwrite and append                                     |
| dD                       | delete                                                         |
| dd                       | cut                                                            |
| ud                       | uncut                                                          |
| yy                       | copy                                                           |
| uy                       | uncopy                                                         |
| Temporary workarounds    |                                                                |
| d/ygg d/yG d/yj d/yk     |                                                                |
| Tabs                     |                                                                |
| <A-1...9>                | open tab 1...9                                                 |
| Sorting                  |                                                                |
| os                       | sort size                                                      |
| :extract [DIRECTORY]     | extracting files to current or specified directory (optional). |
| :compress [FILENAME.EXT] | compressing selected/marked files/directories to an archive.   |
