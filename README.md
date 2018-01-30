# Alt

The same as [uptech/alt](https://github.com/uptech/alt) but in Ruby targeting my own needs.

## Installation

```ruby
gem install alt
```

## Editor integration

### Vim

Copied from [here](https://github.com/uptech/alt#use-with-vim), there is a piece of code
that could be added to vim to do the job:

```vim
if executable("alt")
  function! AltCommand(path, vim_command)
    let l:alternate = system("alt guess " . a:path)
    if empty(l:alternate)
      echo "No alternate file for " . a:path . " exists!"
    else
      call fzf#run(fzf#wrap('buffers', {
      \ 'source': split(l:alternate),
      \ 'sink': a:vim_command,
      \ 'down': '20%',
      \'options': '-1'
      \}))
    endif
  endfunction

  " Find the alternate file for the current path and open it
  nnoremap <leader>r :call AltCommand(expand('%'), 'e')<cr>
end
```

I would like to support `fzf` to select the right file to switch to when there is more than one.

## Development

Then, run `rake test` to run the tests.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nicoolas25/alt.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
