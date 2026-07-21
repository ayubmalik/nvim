# Plugin Tutorials

## nvim-autopairs

Pairs are auto-closed as you type. No keymaps to learn — just type naturally.

| Trigger | Result | Cursor |
|---------|--------|--------|
| type `(` | `()` | inside |
| type `{` | `{}` | inside |
| type `"` | `""` | inside |
| `<BS>` inside empty pair | deletes both chars | — |
| `<CR>` inside `{}` | expands with indent | on new line |

### Go

```go
// type: fmt.Println(  →  fmt.Println(|)
// type: map[string]  →  map[string]|  (no pair — ] already closed)
// type: struct {<CR>
// expands to:
type Point struct {
    |
}
```

### Java

```java
// type: new ArrayList(<CR>
// expands to:
List<String> items = new ArrayList(
    |
);
```

### HTML

```html
<!-- type: <div><CR>  expands to: -->
<div>
    |
</div>
```

---

## nvim-surround

Add, delete, or change surrounding pairs around text objects or motions.

| Keymap | Action |
|--------|--------|
| `ys{motion}{char}` | add surround |
| `yss{char}` | surround current line |
| `ds{char}` | delete surround |
| `cs{old}{new}` | change surround |
| `S{char}` | surround visual selection |

**Common chars:** `(` `)` `[` `]` `{` `}` `"` `'` `` ` `` `t` (HTML tag)

> Note: `(` adds spaces inside — e.g. `( word )`. Use `)` for no spaces.

### Go

```go
// cursor on: world
name := "world"
// cs"` → name := `world`
// ds"  → name := world

// cursor on: err != nil
if err != nil { ... }
// ysiw(  →  if (err) != nil  (inner word)
// ys3w)  →  (err != nil)    (3 words, no spaces)

// Visual: select `http.StatusOK, data`
w.WriteHeader(http.StatusOK, data)
// S)  →  w.WriteHeader((http.StatusOK, data))
```

### Java

```java
// cursor on: user.getName()
return user.getName();
// ysiw"  →  return "user".getName();  (quotes the word)
// ysf()  →  return (user.getName());  (to end of f motion)

// change annotation quotes (cursor anywhere in string)
@RequestMapping("/api/users")
// cs"'  →  @RequestMapping('/api/users')

// Visual: select `userId, role`
createUser(userId, role);
// S)  →  createUser((userId, role));
```

### HTML

For HTML, use `t` as the char to surround with a tag.

```html
<!-- cursor on: Hello World -->
Hello World
<!-- ysiWt  →  prompts for tag name, type: p<CR> -->
<p>Hello World</p>

<!-- cursor inside <p> tag -->
<p>Hello World</p>
<!-- cst  →  prompts for new tag, type: h1<CR> -->
<h1>Hello World</h1>

<!-- dst  →  deletes surrounding tag -->
Hello World

<!-- Visual: select multiple lines, then St -->
<ul>
    <li>One</li>
    <li>Two</li>
</ul>
<!-- Select all li lines, S<ul><CR> wraps in <ul> -->
```

---

## nvim-treesitter-textobjects

Text objects based on syntax tree. Use with any operator: `d`, `y`, `c`, `v`.

| Keymap | Object |
|--------|--------|
| `af` / `if` | around / inner function |
| `ac` / `ic` | around / inner class |
| `ao` | around comment |
| `as` | language scope |
| `<leader>a` | swap param with next |
| `<leader>A` | swap param with previous |

> `af` includes the function signature. `if` is body only.
> Works in operator-pending (`o`) and visual (`v`) mode.

### Go

```go
func (s *Server) Greet(name string) string {
    return "Hello, " + name
}

// dif  →  delete function body (keep signature)
// daf  →  delete entire function including signature
// yaf  →  yank entire function (paste elsewhere)
// cif  →  change body, enter insert mode inside

func process(a int, b int, c int) {}
// cursor on `a`, <leader>a  →  process(b, a, c)  swap with next
// cursor on `b`, <leader>A  →  process(b, a, c)  swap with prev
```

### Java

```java
public class UserService {

    // dac  →  delete entire class
    // vac  →  visually select class (then S{ to re-wrap, etc.)

    public String getFullName(String first, String last) {
        return first + " " + last;
    }

    // dif  →  deletes body, leaves method signature
    // yaf  →  yank full method, paste to another class
    // cursor on `first`: <leader>a  →  getFullName(last, first)
}
```

### HTML

```html
<div class="card">
    <h1>Title</h1>
    <!-- This is a heading -->
    <p>Body text</p>
</div>

<!-- dao  →  delete the comment line -->
<!-- vaf  →  visually select nearest function/block (js in script tags) -->

<script>
function render(items, container) {
    container.innerHTML = items.join('');
}
// daf  →  delete entire function
// cursor on `items`: <leader>a  →  render(container, items)
</script>
```
