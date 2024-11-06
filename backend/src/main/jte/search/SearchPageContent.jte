<%--we need this twice:--%>
<%--- 1. embedded in main layout when serving the initial request--%>
<%--- 2. as a "fragment" that is replace inside the layout when pressing the "clear" button--%>

@param org.springframework.data.domain.Page<nh.recipify.domain.api.RecipeDto> recipes
@param String search = ""
@param boolean fresh = false
@param boolean hasMore = false
@param Integer nextPage = null

<main>
    <div class="container mx-auto mt-8 flex max-w-96 pt-8">
        <input
                type="search"
                name="search"
                id="searchField"
                autocomplete="off"
                aria-label="Enter at least three chars to start searching for recipes"
                class="h-8 w-full max-w-full rounded border border-gray-400 bg-white p-6 text-gray-500 hover:shadow-lg"
                value="${search}"
                hx-swap="outerHTML"
                hx-get="/search?slowdown=0"
                hx-trigger="input[target.value.length > 2] changed"
                hx-target="#searchResult"
                hx-indicator="#searchIndicator"
                hx-on:input="handleInputChange(event)"

        />
        <button
                class="ms-2 cursor-pointer text-gray-500 underline hover:text-gray-900"
                hx-get="/search/reset"
                hx-swap="outerHTML"
                hx-target="main"
                hx-push-url="/"
        >
            Clear
        </button>
    </div>

    <div class="mt-2 flex justify-center text-gray-500" id="inputHint">
        Type three letters to start search
    </div>

    @template.components.LoadingIndicator(id = "searchIndicator")

    @template.search.SearchResult(fresh = fresh, recipes = recipes)

    @template.search.FindMoreButton(hasMore = hasMore, nextPage = nextPage, search = search)

    <script>
      function handleInputChange(e) {
        const hint = document.getElementById("inputHint");

        const shouldShowInputHint = e.target.value.length < 3;
        if (shouldShowInputHint) {
          hint.classList.remove("opacity-0");
        } else {
          hint.classList.add("opacity-0");
        }
      }
    </script>
</main>