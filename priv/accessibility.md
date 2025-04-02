# Accessibility
### Accessibility Concern 1: Alternative Text for Images

#### Description: Alternative text, also known as "alt text", is a brief text description of an image that is read by screen readers or other assistive technologies. Alternative text allows people with visual impairments to understand the content of an image from the text description provided.

#### Example Code:
```elixir
# Elixir code - Using "alt text" for an image
def image_tag(assigns) do
  ~H"""
  <img src="/path/to/image.jpg" alt="A description of the image" />
  """
end
```

The example elixir code above and the example heex code below shows how alternative text is used in an image tag. You simply say "alt" followed by an equal sign with the alternative text in quotation marks.

```heex
<img src="/images/logo.png" alt="Company Logo" class="w-full h-auto"/>
```

#### Sample from my code:
```heex
<img
  src={~p"/images/SeniorPortrait.jpg"}
  alt="High school senior portrait of Ashley Albert. Ashley is seen smiling with dark blonde hair,
  pale skin, and is wearing a gold cross necklace with a black off the shoulder drape."
  class="w-48 h-48 mx-auto rounded-full border-4 border-gray-300 shadow-md object-cover
  dark:border-gray-500"
/>
```

### Accessibility Concern 2: Labels for Form Inputs

#### Description: Labels should be used with form inputs to provide clear context and improve usability for screen reader users. Screen readers will properly announce the form field, thus improving usability for visually impaired users. Labels are either associated with the input via the for attribute or wrapped around the input element.

#### Example Code:
```elixir
# Elixir code - Using a label with an input field
def input(%{type: "text"} = assigns) do
  ~H"""
  <div>
    <label for="email" class="block mb-2">Email Address</label>
    <input type="email" id="email" name="user[email]" class="border rounded p-2 w-full"/>
  </div>
  """
end
```

The code directly below and above shows that an actual label element exists and can be used for form inputs. The sample from my code found further below will show how a label can be an attribute used for input elements.

```heex
<label for="user_name">Name</label>
<input type="text" id="user_name" name="user[name]" class="border rounded p-2 w-full"/>
```

#### Sample from my code:
```heex
<.modal id="contact-modal" heading={gettext("Contact us")} backdrop="static">
 <.simple_form :let={f} for={@message_changeset} action={~p"/messages"} class="mb-6">
  <.input field={f[:email]} class="dark:text-white" type="text" label={gettext("Email")} />
  <.input field={f[:subject]} class="dark:text-white" type="text" label={gettext("Subject")} />
  <.input field={f[:message]} class="dark:text-white" type="text" label={gettext("Message")} />
  <:actions>
    <.button type="submit" color="alternative"> {gettext("Save Message")} </.button>
  </:actions>
</.simple_form>
</.modal>
```

### Accessibility Concern 3: Color Contrast

#### Description: Color contrast is crucial to make text readable for people with visual impairments, such as color blindness. You should ensure that text contrasts enough its background to meet WCAG standards. Use high-contrast color schemes or tools to check contrast ratios to help ensure readability.

#### Example Code:
```elixir
# Elixir code - Applying high contrast text color for readability
def header(%{text: text}) do
  ~H"""
  <h1 class="text-black bg-white p-4">{text}</h1>
  """
end
```

The code showed above and below shows that text and nackground colors should be of high-contrast. On my one web page, for example, as seen in the personal example further below, I have a light gray background with dark gray text when in light mode and a dark gray background with light gray text when in dark mode. These colors are of high-contrast, thus making the website accessible to those with visual impairments.

```heex
<h1 class="text-black bg-white p-4">Important Heading</h1>
```

#### Sample from my code:
```heex
<body class="bg-gray-100 text-gray-900 dark:bg-gray-900 dark:text-gray-100">
```

### Accessibility Concern 4: Keyboard Accessibility

#### Description: Making sure users can navigate the website using only a keyboard is essential for accessibility. Websites can use tabindex for custom focus order and ensuring that focus is clearly visible. A custom focus order is important so that when a user uses the keyboard, the website navigates in a logical order.

#### Example Code:
```elixir
# Elixir code - Example managing focus and tab order
def button_with_focus(assigns) do
  ~H"""
  <button tabindex="0" class="focus:outline-none focus:ring-2 focus:ring-blue-500">
    Click Me
  </button>
  """
end
```

As seen in the exmaple code snippets, tabindex can be used to give an order to the elements that you want to navigable via the keyboard.

```heex
<button tabindex="0" class="focus:outline-none focus:ring-2 focus:ring-blue-500">Click Me</button>
```

#### Sample from my code:
```heex
<li class="relative group">
  <.link href={~p"/"} tabindex="1" class="px-4 py-2 block hover:bg-gray-700 dark:hover:bg-gray-400 rounded-md transition-all">{gettext("Home")}</.link>
  <ul class="hidden group-hover:block group-hover:delay-150 md:absolute md:left-0 md:bg-gray-800 md:dark:bg-gray-300 md:mt-1 md:w-44 md:rounded-md md:shadow-lg md:border md:border-gray-700 md:dark:border-gray-400
    md:p-0 p-2 bg-gray-900 dark:bg-gray-200 rounded-md md:shadow-none">
    <li><.link href={~p"/courses"} tabindex="2" class="block px-4 py-2 hover:bg-gray-700 dark:hover:bg-gray-400">{gettext("Courses")}</.link></li>
    <li><.link href={~p"/facemash"} tabindex="3" class="block px-4 py-2 hover:bg-gray-700 dark:hover:bg-gray-400">{gettext("Destinations")}</.link></li>
  </ul>
</li>
```

### Accessibility Concern 5: Semantic HTML Elements

#### Description: Semantic HTML tags help screen readers and search engines understand the structure and meaning of the web page's content. Elements like h1, h2, main, footer, article, and section, for example, should be used where appropriate to improve accessibility.

#### Example Code:
```elixir
# Elixir code - Using semantic HTML tags
def main_content(assigns) do
  ~H"""
  <header class="bg-blue-800 p-4">
    <h1>Welcome to My Site</h1>
  </header>
  <main>
    <section class="p-6">
      <p>Here's the main content of the page.</p>
    </section>
  </main>
  <footer class="bg-gray-700 p-4 text-center text-white">
    <p>&copy; 2025 My Company</p>
  </footer>
  """
end
```

All of these code examples show the importance of using different elements appropriately. These different elements separate the page for better screen reader usability and search engines. Using header, main, footer, h1, table, thead, tbody, etc. are all ways of using semantic HTML elements.

```heex
<header class="bg-blue-800 p-4">
  <h1>Welcome to Our Site</h1>
</header>
<main>
  <section class="p-6">
    <p>This section contains important information.</p>
  </section>
</main>
<footer class="bg-gray-700 p-4 text-center text-white">
  <p>&copy; 2025 Our Company</p>
</footer>
```

#### Sample from my code:
```heex
<div class="max-w-6xl mx-auto p-6">
  <h1 class="text-2xl font-bold text-gray-900 mb-4 dark:text-gray-100">{gettext("Ashley's Courses")}</h1>

  <table class="min-w-full table-auto border-collapse border border-gray-200 shadow-lg rounded-lg overflow-hidden dark:border-gray-600">
    <thead class="bg-gray-100 dark:bg-gray-700">
      <tr>
        <th class="px-4 py-2 text-left text-sm font-semibold text-gray-700 dark:text-gray-300">{gettext("Semester")}</th>
        <th class="px-4 py-2 text-left text-sm font-semibold text-gray-700 dark:text-gray-300">{gettext("Course")}</th>
      </tr>
    </thead>
    <tbody>
      <%= for {course, name} <- Enum.flat_map(@courses, fn course -> Enum.map(course.name, &{course.semester, &1}) end) do %>
        <tr class="bg-white border-b hover:bg-gray-50 dark:bg-gray-800
        dark:hover:bg-gray-700 dark:border-gray-600">
          <td class="px-4 py-3 text-sm text-gray-800 dark:text-gray-200"><%= course %></td>
          <td class="px-4 py-3 text-sm text-gray-600 dark:text-gray-400"><%= name %></td>
        </tr>
      <% end %>
    </tbody>
  </table>
</div>
```

### Accessibility Concern 6: Skip Links

#### Description: Skip links allow users to bypass repitive content, such as navigation menus, and jump directlt to the main content of the web page. This is especially useful for screen reader users and people who navigate with a keyboard. This improves browsing expereince for many users.

#### Example Code:
```elixir
# Elixir code - Skip link implementation
def skip_link(assigns) do
  ~H"""
  <a href="#main-content" class="sr-only focus:not-sr-only">Skip to main content</a>
  """
end
```

A skip link works best when you create an "a href" that will navigate to the id of the content or link that you provide it. In my personal example, you can see that my navigation bar is skippable content since it is repetitive across all pages. I give my main content an id of "main-content", which is then used in my "a href" to use to skip to.

```heex
<a href="#main-content" class="sr-only focus:not-sr-only">Skip to main content</a>
```

#### Sample from my code:
```heex
<a href="#main-content" class="sr-only focus:not-sr-only text-white dark:text-black">
    Skip to main content
    </a>

<%!-- Other content  --%>

<main id="main-content" class="px-4 py-20 sm:px-6 lg:px-8">
  <div class="mx-auto max-w-2xl">
    <.flash_group flash={@flash} />
    {@inner_content}
  </div>
</main>
```

### Accessibility Concern 7: Screen Reader Usability

#### Description: The sr-only class us useful for content that should only be accessible to screen readers, like skip links, instructions, or additional content for visual elements. This class hides content from sighted users while making it available to users relying on screen readers. This ensures that important content is still accessible without cluttering the visual design.

#### Example Code:
```elixir
# Elixir code - Screen reader only content
def sr_only_content(assigns) do
  ~H"""
  <div class="sr-only">
    <p>This is content for screen reader users only.</p>
  </div>
  """
end
```

The class "sr-only" is content that is to be read by screen readers only. This should be added where people may need context since they lack the visual cues needed to understand the website or how an element functions. In my personal code, I have an "sr-only" that tells the user that the button shown is meant to "Open the main menu".

```heex
<div class="sr-only">
  <p>This content is only visible to screen readers.</p>
</div>
```

#### Sample from my code:
```heex
<button
  id="menu-button"
  type="button"
  class="md:hidden p-2 w-10 h-10 text-gray-500 rounded-lg hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700"
  aria-controls="menu"
  aria-expanded="false"
  phx-click={toggle_menu()}
>
  <span class="sr-only">Open main menu</span>
  <svg class="w-5 h-5" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 17 14">
    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M1 1h15M1 7h15M1 13h15" />
  </svg>
</button>
```



